import 'package:flutter/material.dart';
import '../../../AppLayers/Streaming/Observer.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../RoleScreens/ViewAllRoles/role_manager.screen.dart';
import '../../RoleScreens/ViewAllRoles/roles_data_table_model.dart';

class DashboardRolesDataTable extends StatefulWidget {
   const DashboardRolesDataTable({super.key});
  @override
  State<DashboardRolesDataTable> createState() => _DashboardRolesDataTableState();
}
class _DashboardRolesDataTableState extends State<DashboardRolesDataTable> {
  @override
  Widget build(BuildContext context) {
    ViewRoleManager viewRoleManager =
    Provider.of(context).fetch(ViewRoleManager);
    return Observer<List<AllRoleModel>>(
        stream: viewRoleManager.mainList,
        onSuccess: (context,snapshot) {
          List<AllRoleModel>? data = snapshot;
          AllRoleModel modelData = data![0];
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              child: DataTable(
                columnSpacing: MediaQuery.of(context).size.width * 0.085,
                columns: [
                  DataColumn(
                    label: Text("ID",
                      style: TextStyle(
                        color: Overseer.grayColors,
                        fontSize: 22.sp,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text("Name",
                      style: TextStyle(
                        color: Overseer.grayColors,
                        fontSize: 22.sp,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text("Email",
                      style: TextStyle(
                        color: Overseer.grayColors,
                        fontSize: 22.sp,
                      ),
                    ),
                  ),
                ],
                rows: List.generate(
                  modelData.data.length > 3 ? 3 : modelData.data.length,
                      (index) {
                    return DataRow(
                      cells: [
                        DataCell(
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                            child: Text(
                              modelData.data[index].id.toString(),
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
                            modelData.data[index].name.toString(),
                            style: TextStyle(
                              color: Overseer.textColors,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            modelData.data[index].email.toString(),
                            style: TextStyle(
                              color: Overseer.textColors,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
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
    );
  }
}