import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';
import '../../../AppLayers/Streaming/Observer.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../UploadUserOverviewScreen/view_upload_overview_screen.dart';
import 'all_upload_manager_screen.dart';
import 'upload_user_model.dart';

class UploadDataTable extends StatelessWidget {
  const UploadDataTable({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context){
    AllUploadManager allUploadManager =
    Provider.of(context).fetch(AllUploadManager);
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Overseer.whiteColors,
        borderRadius:  BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Observer<List<UploadModel>>(
    stream: allUploadManager.mainList,
    onSuccess: (context,snapshot) {
      List<UploadModel>? data = snapshot;
      UploadModel modelData = data![0];
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
                        Text("Upload Data",
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
                      (index){
                        return DataRow(
                          cells: [
                            DataCell(
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                                    child: Row(
                                      children: [
                                        // Image.asset("assets/icons/Document_2_icon.png"),
                                        // SizedBox(width: 8.w,),
                                        Text(
                                          "Name here",
                                          style: TextStyle(
                                            color: Overseer.textColors,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            DataCell(
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0.r) ,//
                                  ),
                                ),
                                child: Text(modelData.data[index].count,
                                  style: TextStyle(
                                    color: Overseer.textColors,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
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
                                onTap: (){
                                  Get.to( ViewUploadScreen(
                                    id:modelData.data[index].id,
                                    name:modelData.data[index].fileId,
                                   count:modelData.data[index].count,
                                    activity:modelData.data[index].activity,
                                    createDate:modelData.data[index].createdAt.substring(0,10),
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
                      },
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
      ),
    );
  }
}