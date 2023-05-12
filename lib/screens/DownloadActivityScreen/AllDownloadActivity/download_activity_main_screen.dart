import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Streaming/Observer.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../responsive.dart';
import '../../RoleScreens/Widgets/dashboard_big_text_widgets.dart';
import '../../RoleScreens/Widgets/header.dart';
import '../DownloadUserOverviewScreen/user_download_overview_screen.dart';
import 'all_download_activity_manager.dart';
import 'download_data_table_model.dart';

class DownloadActivityMainScreen extends StatefulWidget {
  const DownloadActivityMainScreen({Key? key}) : super(key: key);

  @override
  State<DownloadActivityMainScreen> createState() => _DownloadActivityMainScreenState();
}

class _DownloadActivityMainScreenState extends State<DownloadActivityMainScreen> {
  String? name;
  String? count;
  String? activity;
  String? createDate;
  refresh() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    AllDownloadManager allDownloadManager =
        Provider.of(context).fetch(AllDownloadManager);
    return Overseer.viewVisi == false?Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardBigTextWidgets(
          title: 'Download Activity',
        ),
        SizedBox(
          height: 30.h,
        ),
        Container(
          height: 850.h,
          decoration: BoxDecoration(
            color: Overseer.whiteColors,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 30.w, right: 20.w, top: 25.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Downloads",
                        style: TextStyle(
                            color: Overseer.textColors,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500),
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(
                          height: Get.height * .050,
                          width: Get.width * .2,
                          child: const SearchField()),
                  ],
                ),
                SizedBox(height: 30.h),
                SingleChildScrollView(
                  child: SizedBox(
                    height: 740.h,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Observer<List<DownloadModel>>(
                          stream: allDownloadManager.mainList,
                          onSuccess: (context, snapshot) {
                            List<DownloadModel>? data = snapshot;
                            DownloadModel modelData = data![0];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SingleChildScrollView(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: DataTable(
                                      horizontalMargin: 0,
                                      columnSpacing:
                                          MediaQuery.of(context).size.width * .09,
                                      columns: [
                                        DataColumn(
                                          label: Row(
                                            children: [
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
                                                "Activity",
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
                                        // DataColumn(
                                        //   label: Text(
                                        //     "View",
                                        //     style: TextStyle(
                                        //         color: Overseer.grayColors,
                                        //         fontSize: 22.sp),
                                        //   ),
                                        // ),
                                      ],
                                      rows: List.generate(modelData.data!.length,
                                          (index) {
                                        return DataRow(
                                          cells: [
                                            DataCell(
                                              Text(
                                                modelData.data![index].userName.toString(),
                                                style: TextStyle(
                                                  color: Overseer.textColors,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                modelData.data![index].activity.toString(),
                                                style: TextStyle(
                                                  color: Overseer.textColors,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                modelData.data![index].createdAt!
                                                    .substring(0, 19),
                                                style: TextStyle(
                                                  color: Overseer.textColors,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            // DataCell(
                                            //   InkWell(
                                            //     onTap: () {
                                            //         name= modelData.data![index].userName.toString();
                                            //         activity= modelData.data![index].activity.toString();
                                            //         createDate= modelData.data![index].createdAt.toString();
                                            //         setState(() {
                                            //           Overseer.viewvisi=true;
                                            //         });
                                            //     },
                                            //     child: Text(
                                            //       "View",
                                            //       style: TextStyle(
                                            //         color: Overseer.primaryColor,
                                            //         fontSize: 20.sp,
                                            //         fontWeight: FontWeight.w400,
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        );
                                      }),
                                    ),
                                  ),
                                ),
                              ],
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    )
        : SizedBox(
      height: 950.h,
      child: ViewDownloadScreen(
        name: name,
        activity: activity,
        createDate: createDate,
        notifyParent: refresh,
      ),
    );
  }
}
