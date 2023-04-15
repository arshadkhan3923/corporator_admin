import 'package:corporator_admin/screens/WorkspaceScreens/AllWorkSpace/workspace_data_table_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../WorkSpaceOverviewScreen/workSpce_overview_screen.dart';

class WorkSpaceDataTable extends StatelessWidget {
  const WorkSpaceDataTable({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: DataTable(
              horizontalMargin: 0,
              columnSpacing: MediaQuery.of(context).size.width*.08,
              columns:  [
                DataColumn(
                  label: Row(
                    children: [
                      SizedBox(width: 15.w,),
                      Text("Name",
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
                      Text("Total Storage",
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
                      Text("Storage Left",
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
                      Text("Upload Date",
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
                // DataColumn(
                //   label: Text("Action",
                //     style: TextStyle(
                //       color: Overseer.grayColors,
                //       fontSize: 22.sp
                //   ),
                //   ),
                // ),
              ],
              rows: List.generate(
                workSpaceModel.length,
                (index) => workspaceUserDataRow(workSpaceModel[index], context),
              ),
            ),
          ),
        ),
      ],
    );
  }

}
DataRow workspaceUserDataRow(WorkSpaceDataTableModel userInfo, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Row(
            children: [
              Image.asset(userInfo.image!),
              SizedBox(width: 8.w,),
              Text(
                userInfo.name!,
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
      ),
      DataCell(
        Text(userInfo.totalStorage!,
          style: TextStyle(
            color: Overseer.textColors,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      DataCell(
        Text(userInfo.storageLeft!,
        style: TextStyle(
        color: Overseer.textColors,
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
      ),
      ),
      ),
      DataCell(
        Text(userInfo.uploadDate!,
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
            Get.to(const ViewWorkSpaceScreen());
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
      // DataCell(
      //   InkWell(
      //     onTap: (){
      //      Get.to( const UpdateWorkSpaceScreen());
      //     },
      //     child: Text("Edit",
      //     style: TextStyle(
      //       color: Overseer.primaryColor,
      //       fontSize: 20.sp,
      //       fontWeight: FontWeight.w400,
      //     ),
      // ),
      //   ),
      // ),
    ],
  );

}

