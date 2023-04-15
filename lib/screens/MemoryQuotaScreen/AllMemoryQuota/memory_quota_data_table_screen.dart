import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../Widgets/sow_entry_and_search_widgets.dart';
import '../MemoryQuotaOverviewScreen/memoey_quota_overview_screen.dart';
import '../UpdateMemoryQuotaScreen/EditMemoryQuotaProfileScreen/edit_memoey_quota_profile.dart';
import 'memory_quota_data_table_model.dart';

class MemoryQuotaDataTable extends StatelessWidget {
  const MemoryQuotaDataTable({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Overseer.whiteColors,
        borderRadius:  BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h),
          ShowEntryAndSearch(number: "",),
          SingleChildScrollView(
            //scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: double.infinity,
              child: DataTable(
                horizontalMargin: 0,
                columnSpacing: MediaQuery.of(context).size.width*.1,
                columns:  [
                  DataColumn(
                    label: Row(
                      children: [
                        SizedBox(width: 15.w,),
                        Text("ID",
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
                        Text("User Id",
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
                        Text("Package Id",
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
                  DataColumn(
                    label: Text("Action",
                      style: TextStyle(
                          color: Overseer.grayColors,
                          fontSize: 22.sp
                      ),
                    ),
                  ),
                ],
                rows: List.generate(
                  memoryQuotaModel.length,
                      (index) => memoryQuotaUserDataRow(memoryQuotaModel[index], context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
DataRow memoryQuotaUserDataRow(MemoryQuotaDataTableModel userInfo, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(userInfo.id!,
            style: TextStyle(
              color: Overseer.textColors,
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      DataCell(
        Text(userInfo.maxSpace!,
          style: TextStyle(
            color: Overseer.textColors,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      DataCell(
        Text(userInfo.userId!,
          style: TextStyle(
            color: Overseer.textColors,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      DataCell(
        Text(userInfo.packageId!,
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
            Get.to(const ViewUserMemoryQuotaScreen());
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
      DataCell(
        InkWell(
          onTap: (){
           Get.to(const UpdateMemoryQuotaUserScreen());
          },
          child: Text("Edit",
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