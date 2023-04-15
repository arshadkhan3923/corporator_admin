import 'package:corporator_admin/screens/RoleScreens/ViewAllRoles/role_manager.screen.dart';
import 'package:corporator_admin/screens/RoleScreens/ViewAllRoles/roles_data_table_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';
import '../../../AppLayers/Streaming/Observer.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../Widgets/sow_entry_and_search_widgets.dart';
import '../RoleUserOverviewScreen/user_role_overview_screen.dart';
import '../UpdateRoleScreen/EditRoleProfileScreen/edit_role_profile.dart';

class RolesDataTable extends StatefulWidget {
  const RolesDataTable({
    Key? key,
  }) : super(key: key);
  @override
  State<RolesDataTable> createState() => _RolesDataTableState();
}
class _RolesDataTableState extends State<RolesDataTable> {
  @override
  Widget build(BuildContext context) {
    ViewRoleManager viewRoleManager = Provider.of(context).fetch(ViewRoleManager);
    return Container(
        height: 1000.h,
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: Overseer.whiteColors,
          borderRadius:  BorderRadius.all(Radius.circular(10.r)),
        ),
        child: SingleChildScrollView(
          child: Observer<List<AllRoleModel>>(
            stream: viewRoleManager.mainList,
            onSuccess: (context,snapshot){
              List<AllRoleModel>? data =snapshot;
              AllRoleModel modelData =data![0];
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    ShowEntryAndSearch(number:"${modelData.data.length}"),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: DataTable(
                              horizontalMargin: 0,
                              columnSpacing:MediaQuery.of(context).size.width*.05,
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
                                      Text("Name",
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
                                      Text("Email",
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
                                      Text("Update",
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
                                  modelData.data.length,
                                      (index) {
                                    return DataRow(
                                      cells: [
                                        DataCell(
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                                            child: Text(modelData.data[index].id.toString(),
                                              style: TextStyle(
                                                color: Overseer.textColors,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Text(modelData.data[index].name.toString(),
                                            style: TextStyle(
                                              color: Overseer.textColors,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Text(modelData.data[index].email.toString(),
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
                                        DataCell(
                                            InkWell(
                                              onTap:(){
                                                Overseer.userId = modelData.data[index].id.toString();
                                                Get.to( ViewUSerRoleScreen(
                                                      id: modelData.data[index].id.toString(),
                                                      name: modelData.data[index].name,
                                                      email: modelData.data[index].email,
                                                      update: modelData.data[index].updatedAt.substring(0,10),
                                                 ),
                                                );
                                              },
                                              child: Text("View",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            )
                                        ),
                                        DataCell(
                                            InkWell(
                                              onTap:(){
                                                Get.to( const UpdateRoleScreen(),
                                                );
                                              },
                                              child: Text("Edit",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            )
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
        )
    );
  }
}

