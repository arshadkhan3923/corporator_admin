import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Observer.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../Widgets/sow_entry_and_search_widgets.dart';
import '../../../constants.dart';
import '../../RoleScreens/Widgets/dashboard_big_text_widgets.dart';
import '../MemoryQuotaOverviewScreen/memoey_quota_overview_screen.dart';
import 'memory_quota_Model.dart';
import 'memory_quota_manager.dart';
import 'dart:async';


class MemoryQuotaMainScreen extends StatefulWidget {
  const MemoryQuotaMainScreen({Key? key}) : super(key: key);

  @override
  State<MemoryQuotaMainScreen> createState() => _MemoryQuotaMainScreenState();
}
class _MemoryQuotaMainScreenState extends State<MemoryQuotaMainScreen> {
  String? id;
  String? userName;
  String? packName;
  String? maxSpace;
  String? duration;
  String? image;
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
    AllMemoryQuotaManager allMemoryQuotaManager =
    Provider.of(context).fetch(AllMemoryQuotaManager);
    return Overseer.viewVsi==true
        ? SizedBox(
           height: 950.h,
         child: ViewUserMemoryQuotaScreen(
           userName:userName,
           packName: packName,
           maxSpace: maxSpace,
           duration: duration,
           notifyParent: refresh,
      ),
     )
        : Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
            const DashboardBigTextWidgets(title: 'Memory Quota ',),

        SizedBox(height: 30.h,),
        Container(
          height: 855.h,
          decoration: BoxDecoration(
            color: Overseer.whiteColors,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding:  EdgeInsets.only(left: 30.w,right: 20.w,top: 25.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("All Memory Quota ",
                    style: TextStyle(
                        color: Overseer.textColors,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500
                    ),
                ),
                SizedBox(height: 20.h),
                Observer<List<MemoryQuotaModel>>(
                  stream: allMemoryQuotaManager.mainList,
                  onSuccess: (context,snapshot){
                    List<MemoryQuotaModel>? data =snapshot;
                    MemoryQuotaModel modelData =data![0];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        ShowEntryAndSearch(number: "${modelData.data.length}",),
                        SizedBox(height: 10.h),
                        SingleChildScrollView(
                          child: SizedBox(
                            height: 700.h,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: [
                                DataTable(
                                  horizontalMargin: 0,
                                  columnSpacing: MediaQuery.of(context).size.width*.1,
                                  columns:  [
                                    DataColumn(
                                      label: Row(
                                        children: [
                                          SizedBox(width: 15.w,),
                                          Text("Duration",
                                            style: TextStyle(
                                                color: Overseer.grayColors,
                                                fontSize: 22.sp
                                            ),
                                          ),
                                          Icon(Icons.arrow_drop_down,size: 22.sp,
                                            color: Overseer.grayColors,
                                          ),
                                        ],
                                      ),
                                    ),
                                    DataColumn(
                                      label: Row(
                                        children: [
                                          Text("Max Space",
                                            style: TextStyle(
                                                color: Overseer.grayColors,
                                                fontSize: 22.sp
                                            ),
                                          ),
                                          Icon(Icons.arrow_drop_down,size: 22.sp, color: Overseer.grayColors,),
                                        ],
                                      ),
                                    ),
                                    DataColumn(
                                      label: Row(
                                        children: [
                                          Text("User Name",
                                            style: TextStyle(
                                                color: Overseer.grayColors,
                                                fontSize: 22.sp
                                            ),
                                          ),
                                          Icon(Icons.arrow_drop_down,size: 22.sp,color: Overseer.grayColors,),
                                        ],
                                      ),
                                    ),
                                    DataColumn(
                                      label: Row(
                                        children: [
                                          Text("Package Name",
                                            style: TextStyle(
                                                color: Overseer.grayColors,
                                                fontSize: 22.sp
                                            ),
                                          ),
                                          Icon(Icons.arrow_drop_down,size: 22.sp,color: Overseer.grayColors,),
                                        ],
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text("View",
                                        style: TextStyle(
                                            color: Overseer.grayColors,
                                            fontSize: 22.sp
                                        ),
                                      ),
                                    ),
                                  ],
                                  rows: List.generate(
                                      modelData.data.length,
                                          (index)  {
                                        return DataRow(
                                          cells: [
                                            DataCell(
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                                                child: Text(modelData.data[index].duration,
                                                  style: TextStyle(
                                                    color: Overseer.textColors,
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Text(modelData.data[index].quota,
                                                style: TextStyle(
                                                  color: Overseer.textColors,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Text(modelData.data[index].user.name,
                                                style: TextStyle(
                                                  color: Overseer.textColors,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Text(modelData.data[index].name,
                                                style: TextStyle(
                                                  color: Overseer.textColors,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              InkWell(
                                                onTap: (){
                                                  Overseer.spacUsDowActId= modelData.data[index].id.toString();
                                                  id= modelData.data[index].id.toString();
                                                  userName= modelData.data[index].user.name;
                                                  packName= modelData.data[index].name;
                                                  maxSpace= modelData.data[index].quota;
                                                  duration= modelData.data[index].duration;
                                                  setState(() {
                                                    Overseer.viewVsi = true;
                                                  });
                                                },
                                                child: Text("View",
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
                                      }
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  onWaiting: (context){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  onError: (context,error){
                    return const Text("Check Your Internet");
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}