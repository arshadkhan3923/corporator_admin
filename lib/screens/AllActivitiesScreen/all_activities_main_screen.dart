import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Widgets/sow_entry_and_search_widgets.dart';
import '../../AppLayers/Streaming/Overseer.dart';
import '../../AppLayers/Streaming/Provider.dart';
import 'all_activities_manager.dart';
import '../../../../constants.dart';
import '../../../AppLayers/Streaming/Observer.dart';
import 'all_activities_model.dart';

class AllActivitiesScreen extends StatefulWidget {
  const AllActivitiesScreen({Key? key}) : super(key: key);
  @override
  State<AllActivitiesScreen> createState() => _AllActivitiesScreenState();
}
class _AllActivitiesScreenState extends State<AllActivitiesScreen> {
  @override
  Widget build(BuildContext context) {
    AllActivityManager allActivityManager =
    Provider.of(context).fetch(AllActivityManager);
    return Container(
        height: 1000.h,
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: Overseer.whiteColors,
          borderRadius:  BorderRadius.all(Radius.circular(10.r)),
        ),
              child:  Observer<List<AllActivitiesModel>>(
               stream: allActivityManager.mainList,
                onSuccess: (context,snapshot){
                 List<AllActivitiesModel>? data =snapshot;
                AllActivitiesModel modelData =data![0];
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.h),
                      ShowEntryAndSearch(number: "${modelData.data.length}"),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: DataTable(
                                horizontalMargin: 0,
                                columnSpacing:MediaQuery.of(context).size.width*.08,
                                columns:  [
                                  DataColumn(
                                    label: Row(
                                      children: [
                                        SizedBox(width: 15.w,),
                                        Text("UserId",
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
                                        Text("FileID",
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
                                        Text("Activities",
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
                                        Text("Count",
                                          style: TextStyle(
                                              color: Overseer.grayColors,
                                              fontSize: 22.sp
                                          ),
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
                                        Text("Created Date",
                                          style: TextStyle(
                                              color: Overseer.grayColors,
                                              fontSize: 22.sp
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          size: 22.sp,
                                          color: Overseer.grayColors,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                rows: List.generate(
                                modelData.data.length,
                                        (index) {
                                      return DataRow(
                                        cells: [
                                          DataCell(
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                                              child: Text(modelData.data[index].userId.toString(),
                                                style: TextStyle(
                                                  color: Overseer.textColors,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Text(modelData.data[index].fileId.toString(),
                                              style: TextStyle(
                                                color: Overseer.textColors,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Text(modelData.data[index].activity.toString(),
                                              style: TextStyle(
                                                color: Overseer.textColors,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Text(modelData.data[index].count.toString(),
                                              style: TextStyle(
                                                color: Overseer.textColors,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Text(modelData.data[index].createdAt.substring(0,10).toString(),
                                              style: TextStyle(
                                                color: Overseer.textColors,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
    );
  }
}
