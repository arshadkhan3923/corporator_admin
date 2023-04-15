import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../constants.dart';

class DashboardWorkSpaceDataTable extends StatefulWidget {
  const DashboardWorkSpaceDataTable({Key? key}) : super(key: key);
  @override
  State<DashboardWorkSpaceDataTable> createState() =>
      _DashboardWorkSpaceDataTableState();
}
class _DashboardWorkSpaceDataTableState extends State<DashboardWorkSpaceDataTable> {
  @override
  Widget build(BuildContext context) {
    // UserDataTableManager userDataTableManager =
    // Provider.of(context).fetch(UserDataTableManager);
        return DataTable(
          horizontalMargin: 0,
          columnSpacing: MediaQuery.of(context).size.width * .12,
          columns: [
            DataColumn(
              label: Row(
                children: [
                  SizedBox(width: 15.w),
                  Text("ID",
                    style: TextStyle(
                        color: Overseer.grayColors,
                        fontSize: 22.sp,
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
                  Text("Name",
                    style: TextStyle(
                            color: Overseer.grayColors,
                            fontSize: 22.sp,
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
                  Text("Email",
                    style: TextStyle(
                        color: Overseer.grayColors,
                        fontSize: 22.sp,
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
            3,
              // modelData.data.length > 3 ? 3 : modelData.data.length,
               (index){
            return DataRow(
              cells: [
                DataCell(
                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(
                       "ID",
                      style: TextStyle(
                        color: Overseer.textColors,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    "name",
                    style: TextStyle(
                      color: Overseer.textColors,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    "email",
                    style: TextStyle(
                      color: Overseer.textColors,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            );
          }),
        );
  }
}
