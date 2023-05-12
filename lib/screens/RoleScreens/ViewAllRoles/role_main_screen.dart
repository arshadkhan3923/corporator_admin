import 'package:corporator_admin/screens/RoleScreens/ViewAllRoles/role_manager.screen.dart';
import 'package:corporator_admin/screens/RoleScreens/ViewAllRoles/roles_data_table_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Observer.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../Widgets/sow_entry_and_search_widgets.dart';
import '../../../constants.dart';
import '../RoleUserOverviewScreen/user_role_overview_screen.dart';
import '../Widgets/dashboard_big_text_widgets.dart';

class RolesMainScreen extends StatefulWidget {
  const RolesMainScreen({Key? key}) : super(key: key);
  @override
  State<RolesMainScreen> createState() => _RolesMainScreenState();
}
class _RolesMainScreenState extends State<RolesMainScreen> {
  String? id;
  String? name;
  String? email;
  String? update;
  String? image;
  refresh() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    ViewRoleManager viewRoleManager =
        Provider.of(context).fetch(ViewRoleManager);
    return Overseer.viewVisi==true? SizedBox(
        height: 950.h,
        child: ViewUSerRoleScreen(
          id :id,
          name :name,
          email :email,
          update :update,
          notifyParent: refresh,
        ),
      )
    : Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardBigTextWidgets(title: 'Roles'),
        SizedBox(
          height: 30.h,
        ),
        Container(
          height: 860.h,
          decoration: BoxDecoration(
            color: Overseer.whiteColors,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 30.w, right: 20.w, top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DashboardBigTextWidgets(title: 'All Roles'),
                SizedBox(height: 20.h),
                Observer<List<AllRoleModel>>(
                  stream: viewRoleManager.mainList,
                  onSuccess: (context, snapshot) {
                    List<AllRoleModel>? data = snapshot;
                    AllRoleModel modelData = data![0];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        ShowEntryAndSearch(
                            number: "${modelData.data.length}",
                        ),
                        SizedBox(height: 10.h),
                        SizedBox(
                          height: 685.h,
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              DataTable(
                                horizontalMargin: 0,
                                columnSpacing:
                                    MediaQuery.of(context).size.width * .05,
                                columns: [
                                  DataColumn(
                                    label: Row(
                                      children: [
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        Text("ID",
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
                                          "Name",
                                          style: TextStyle(
                                              color: Overseer
                                                  .grayColors,
                                              fontSize: 22.sp),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          size: 22.sp,
                                          color:
                                              Overseer.grayColors,
                                        ),
                                      ],
                                    ),
                                  ),
                                  DataColumn(
                                    label: Row(
                                      children: [
                                        Text(
                                          "Email",
                                          style: TextStyle(
                                              color: Overseer
                                                  .grayColors,
                                              fontSize: 22.sp),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          size: 22.sp,
                                          color:
                                              Overseer.grayColors,
                                        ),
                                      ],
                                    ),
                                  ),
                                  DataColumn(
                                    label: Row(
                                      children: [
                                        Text(
                                          "Update",
                                          style: TextStyle(
                                              color: Overseer
                                                  .grayColors,
                                              fontSize: 22.sp),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          size: 22.sp,
                                          color:
                                              Overseer.grayColors,
                                        ),
                                      ],
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "View",
                                      style: TextStyle(
                                          color:
                                              Overseer.grayColors,
                                          fontSize: 22.sp),
                                    ),
                                  ),
                                ],
                                rows: List.generate(
                                    modelData.data.length, (index) {
                                  return DataRow(
                                    cells: [
                                      DataCell(
                                        Padding(
                                          padding: const EdgeInsets
                                                  .symmetric(
                                              horizontal:
                                                  defaultPadding),
                                          child: Text(
                                            modelData.data[index].id
                                                .toString(),
                                            style: TextStyle(
                                              color: Overseer
                                                  .textColors,
                                              fontSize: 20.sp,
                                              fontWeight:
                                                  FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          modelData.data[index].name
                                              .toString(),
                                          style: TextStyle(
                                            color:
                                                Overseer.textColors,
                                            fontSize: 20.sp,
                                            fontWeight:
                                                FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          modelData
                                              .data[index].email
                                              .toString(),
                                          style: TextStyle(
                                            color:
                                                Overseer.textColors,
                                            fontSize: 20.sp,
                                            fontWeight:
                                                FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          modelData
                                              .data[index].createdAt
                                              .substring(0, 10)
                                              .toString(),
                                          style: TextStyle(
                                            color:
                                                Overseer.textColors,
                                            fontSize: 20.sp,
                                            fontWeight:
                                                FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                          InkWell(
                                        onTap: () {
                                          Overseer.spacUsDowActId = modelData.data[index].id.toString();
                                          print("role========== ${Overseer.spacUsDowActId}");
                                              id = modelData.data[index].id.toString();
                                              name = modelData.data[index].name;
                                              email = modelData.data[index].email;
                                              update = modelData.data[index].updatedAt.substring(0, 10);
                                                setState(() {
                                                  Overseer.viewVisi =
                                                  true;
                                                });
                                        },
                                            child: Text(
                                          "View",
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 20.sp,
                                            fontWeight:
                                                FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      ),
                                    ],
                                  );
                                }),
                              ),
                            ],
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
    );
  }
}
