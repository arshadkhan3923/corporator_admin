import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Streaming/Observer.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../DownloadUserOverviewScreen/user_download_overview_screen.dart';
import 'all_download_activity_manager.dart';
import 'download_data_table_model.dart';

class DownloadDataTable extends StatelessWidget {
  const DownloadDataTable({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AllDownloadManager allDownloadManager =
    Provider.of(context).fetch(AllDownloadManager);

    return Observer<List<DownloadModel>>(
        stream: allDownloadManager.mainList,
        onSuccess: (context,snapshot) {
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
                    columnSpacing: MediaQuery.of(context).size.width * .07,
                    columns: [
                      DataColumn(
                        label: Row(
                          children: [
                            Text("Name",
                              style: TextStyle(
                                  color: Overseer.grayColors,
                                  fontSize: 22.sp
                              ),
                            ),
                            Icon(Icons.arrow_drop_down, size: 22.sp,
                              color: Overseer.grayColors,),
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
                            Icon(Icons.arrow_drop_down, size: 22.sp,
                              color: Overseer.grayColors,),
                          ],
                        ),
                      ),
                      DataColumn(
                        label: Row(
                          children: [
                            Text("Activity",
                              style: TextStyle(
                                  color: Overseer.grayColors,
                                  fontSize: 22.sp
                              ),
                            ),
                            Icon(Icons.arrow_drop_down, size: 22.sp,
                              color: Overseer.grayColors,),
                          ],
                        ),
                      ),
                      DataColumn(
                        label: Row(
                          children: [
                            Text("Upload Date",
                              style: TextStyle(
                                  color: Overseer.grayColors,
                                  fontSize: 22.sp
                              ),
                            ),
                            Icon(Icons.arrow_drop_down, size: 22.sp,
                              color: Overseer.grayColors,),
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
                            (index) {
                          return DataRow(
                            cells: [
                              DataCell(
                                Text("Here Name",
                                  style: TextStyle(
                                    color: Overseer.textColors,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(modelData.data[index].count,
                                  style: TextStyle(
                                    color: Overseer.textColors,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(modelData.data[index].activity,
                                  style: TextStyle(
                                    color: Overseer.textColors,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(modelData.data[index].createdAt.substring(0,10),
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
                                    Get.to(ViewDownloadScreen(
                                      id: modelData.data[index].id.toString(),
                                      name: modelData.data[index].fileId.toString(),
                                      count: modelData.data[index].count.toString(),
                                      activity: modelData.data[index].activity.toString(),
                                      createDate: modelData.data[index].createdAt.toString(),
                                    ));
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
    );
  }
}