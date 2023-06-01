import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Streaming/Observer.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../constants.dart';
import '../../../responsive.dart';
import '../../RoleScreens/Widgets/dashboard_big_text_widgets.dart';
import '../../RoleScreens/Widgets/header.dart';
import '../WorkSpaceOverviewScreen/workSpce_overview_screen.dart';
import 'Workspace_Table_manager.dart';
import 'Workspace_Table_model.dart';
import 'dart:async';


class WorkSpaceMainScreen extends StatefulWidget {
  const WorkSpaceMainScreen({Key? key}) : super(key: key);

  @override
  State<WorkSpaceMainScreen> createState() => _WorkSpaceMainScreenState();
}

class _WorkSpaceMainScreenState extends State<WorkSpaceMainScreen> {
  String? name;
  String? totalStorage;
  String? leftStorage;
  String? updateDate;
  String? profileImg;
  String? profileName;
  String? zipCode;
  String? address;
  String? phoneNumber;
  refresh(){
    setState(() {
    });
  }
  ///  Auto Refresh
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    startTimer();
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  void startTimer() {
    const Duration refreshInterval = Duration(seconds: 10);
    _timer = Timer.periodic(refreshInterval, (timer) {
      refreshData();
    });
  }
  void refreshData() {
    setState(() {
      print("Arshad =========== ");
    });
  }

  @override
  Widget build(BuildContext context) {
    WorkSpaceManager workSpaceManager =
        Provider.of(context).fetch(WorkSpaceManager);
    return Overseer.viewVsi==true
        ? SizedBox(
          height: 950.h,
          child: ViewWorkSpaceScreen(
            notifyParent: refresh,
            updateDate:updateDate,
            leftStorage: leftStorage,
            totalStorage: totalStorage,
            name: name,
            profileImg:profileImg,
            profileName: profileName,
            address: address,
            zipCode: zipCode,
            phoneNumber: phoneNumber,
          ),
        )
        : Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardBigTextWidgets(
          title: 'Workspace',
        ),
        SizedBox(
          height: 30.h,
        ),
        Container(
          decoration: BoxDecoration(
            color: Overseer.whiteColors,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 30.w, right: 20.w, top: 25.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("All Workspaces",
                          style: TextStyle(
                              color: Overseer.textColors,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                          ),
                      ),
                      if (!Responsive.isMobile(context))
                        SizedBox(
                            height: Get.height * .050,
                            width: Get.width * .2,
                            child: const SearchField()),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        child: Observer<List<WorkSpaceModel>>(
                          stream: workSpaceManager.mainList,
                          onSuccess: (context, snapshot) {
                            List<WorkSpaceModel>? data = snapshot;
                            WorkSpaceModel modelData = data![0];

                            return SizedBox(
                              width: double.infinity,
                              child: DataTable(
                                horizontalMargin: 0,
                                columnSpacing:
                                    MediaQuery.of(context).size.width * .08,
                                columns: [
                                  DataColumn(
                                    label: Row(
                                      children: [
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        Text(
                                          "Name",
                                          style: TextStyle(
                                              color: Overseer.grayColors,
                                              fontSize: 22.sp),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          size: 22.sp,
                                          color: Overseer.grayColors,
                                        ),
                                      ],
                                    ),
                                  ),
                                  DataColumn(
                                    label: Row(
                                      children: [
                                        Text(
                                          "Total Storage",
                                          style: TextStyle(
                                              color: Overseer.grayColors,
                                              fontSize: 22.sp),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          size: 22.sp,
                                          color: Overseer.grayColors,
                                        ),
                                      ],
                                    ),
                                  ),
                                  DataColumn(
                                    label: Row(
                                      children: [
                                        Text(
                                          "Storage Left",
                                          style: TextStyle(
                                              color: Overseer.grayColors,
                                              fontSize: 22.sp),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          size: 22.sp,
                                          color: Overseer.grayColors,
                                        ),
                                      ],
                                    ),
                                  ),
                                  DataColumn(
                                    label: Row(
                                      children: [
                                        Text(
                                          "Upload Date",
                                          style: TextStyle(
                                              color: Overseer.grayColors,
                                              fontSize: 22.sp),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          size: 22.sp,
                                          color: Overseer.grayColors,
                                        ),
                                      ],
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "View",
                                      style: TextStyle(
                                          color: Overseer.grayColors,
                                          fontSize: 22.sp),
                                    ),
                                  ),
                                ],
                                rows: List.generate(
                                  modelData.data!.length,
                                  (index) {
                                    return DataRow(
                                      cells: [
                                        DataCell(
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: defaultPadding,
                                            ),
                                            child: Row(
                                              children: [
                                                // Image.asset("assets/icons/folder_icon.1.png"),
                                                // SizedBox(
                                                //   width: 8.w,
                                                // ),
                                                Text(
                                                  modelData.data![index].name
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Overseer.textColors,
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            modelData.data![index].quota
                                                .toString(),
                                            style: TextStyle(
                                              color: Overseer.textColors,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            modelData.data![index].user!
                                                    .corporateteams!.isEmpty
                                                ? modelData.data![index].quota
                                                    .toString()
                                                : "${modelData.data![index].user!.corporateteams![0].totalUsedQuota.toString()} GB",
                                            style: TextStyle(
                                              color: Overseer.textColors,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            modelData.data![index].updatedAt
                                                .toString()
                                                .substring(0, 10),
                                            style: TextStyle(
                                              color: Overseer.textColors,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          InkWell(
                                            onTap: () {
                                              Overseer.spacUsDowActId= modelData.data![index].id.toString();

                                                  updateDate= modelData.data![index].updatedAt.toString().substring(0, 10);
                                                  totalStorage= modelData.data![index].quota.toString();
                                                  leftStorage= modelData.data![index].user!.corporateteams!.isEmpty
                                                      ? modelData.data![index].quota.toString()
                                                      : "${modelData.data![index].user!.corporateteams![0].totalUsedQuota.toString()} GB";
                                                  name= modelData.data![index].user!.userinfo!.purpose.toString();
                                                  profileImg= modelData.data![index].user!.userinfo!.picture.toString();
                                                  profileName= modelData.data![index].user!.name.toString();
                                                  address= modelData.data![index].user!.userinfo!.address.toString();
                                                  zipCode= modelData.data![index].user!.userinfo!.zipCode.toString();
                                                  phoneNumber= modelData.data![index].user!.userinfo!.phoneNo.toString();
                                              setState(() {
                                                Overseer.viewVsi = true;
                                              });

                                            },
                                            child: Text(
                                              "View",
                                              style: TextStyle(
                                                color: Overseer.primaryColor,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                          onWaiting: (context) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          onError: (context, error) {
                            return const Text("Check Your Internet");
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
