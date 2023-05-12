import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../DownloadActivityScreen/AllDownloadActivity/download_activity_main_screen.dart';
import '../../RoleScreens/ViewAllRoles/role_main_screen.dart';
import '../../RoleScreens/Widgets/dashboard_big_text_widgets.dart';
import '../../UploadActivityScreens/AllUploadActivity/upload_mctivity_main_screen.dart';
import '../../UserScreens/AllUser/user_main_screen.dart';
import '../../WorkspaceScreens/AllWorkSpace/workspace_main_screen.dart';
import '../GetAllDownloadsActivity/all_downloads_activity.dart';
import '../GetAllRevenueScreen/all_revenue_screen.dart';
import '../GetAllUploadActivity/get_all_upload_activity.dart';
import '../GetAllUsers/all_User_main_screen.dart';
import '../Widgets/chart_text_widget.dart';
import '../Widgets/second_chart_widget.dart';
import 'dashboard_role_data_table.dart';
import 'dashboard_user_data_table_.dart';
import 'dashboard_workspace_data_table_.dart';

class DashboardMainScreen extends StatefulWidget {
  const DashboardMainScreen({Key? key}) : super(key: key);
  @override
  State<DashboardMainScreen> createState() => _DashboardMainScreenState();
}
class _DashboardMainScreenState extends State<DashboardMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Overseer.viewVisi1 == false
        ? const UserMainScreen()
        : Overseer.viewVisi2 == false
            ? const DownloadActivityMainScreen()
            : Overseer.viewVisi3 == false
                ? const UploadActivityMainScreen()
                : Overseer.viewVisi4 == false
                    ? const RolesMainScreen()
                    : Overseer.viewVisi5 == false
                        ? const UserMainScreen()
                        : Overseer.viewVisi6 == false
                            ? const WorkSpaceMainScreen()
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const DashboardBigTextWidgets(
                                    title: 'Dashboard',
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              Overseer.viewVisi1 = false;
                                            });
                                          },
                                          child: const AllUserScreen()),
                                      const AllRevenueScreen(),
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              Overseer.viewVisi2 = false;
                                            });
                                          },
                                          child: const AllDownloadsActivity()),
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              Overseer.viewVisi3 = false;
                                            });
                                          },
                                          child: const AllUploadActivity()),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 325.h,
                                        width: 550.w,
                                        decoration: BoxDecoration(
                                          color: Overseer.whiteColors,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 25.w,
                                                    right: 25.w,
                                                    top: 25.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const DashboardBigTextWidgets(
                                                        title: 'Roles'),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Overseer.viewVisi4 =
                                                              false;
                                                        });
                                                      },
                                                      child: Text(
                                                        "View All",
                                                        style: TextStyle(
                                                            color: Overseer
                                                                .blackColors,
                                                            fontSize: 18.sp),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const DashboardRolesDataTable(),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 550.w,
                                        height: 325.h,
                                        decoration: BoxDecoration(
                                          color: Overseer.whiteColors,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 30.w,
                                              right: 30.w,
                                              top: 25.h),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                const SecondChartWidgets(),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: const [
                                                    ChartTextWidget(
                                                      title: 'JAN',
                                                    ),
                                                    ChartTextWidget(
                                                      title: 'FEB',
                                                    ),
                                                    ChartTextWidget(
                                                      title: 'MAR',
                                                    ),
                                                    ChartTextWidget(
                                                      title: 'APR',
                                                    ),
                                                    ChartTextWidget(
                                                      title: 'MAY',
                                                    ),
                                                    ChartTextWidget(
                                                      title: 'JUN',
                                                    ),
                                                    ChartTextWidget(
                                                      title: 'JULY',
                                                    ),
                                                    ChartTextWidget(
                                                      title: 'AUG',
                                                    ),
                                                    ChartTextWidget(
                                                      title: 'SEP',
                                                    ),
                                                    ChartTextWidget(
                                                      title: 'OCT',
                                                    ),
                                                    ChartTextWidget(
                                                      title: 'NOV',
                                                    ),
                                                    ChartTextWidget(
                                                      title: 'DEC',
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 550.w,
                                        height: 325.h,
                                        decoration: BoxDecoration(
                                          color: Overseer.whiteColors,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 25.w,
                                                    right: 25.w,
                                                    top: 25.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const DashboardBigTextWidgets(
                                                        title: 'Users'),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Overseer.viewVisi5 =
                                                              false;
                                                        });
                                                      },
                                                      child: Text(
                                                        "View All",
                                                        style: TextStyle(
                                                            color: Overseer
                                                                .blackColors,
                                                            fontSize: 18.sp),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const DashboardUserDataTable(),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 550.w,
                                        height: 325.h,
                                        decoration: BoxDecoration(
                                          color: Overseer.whiteColors,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 25.w,
                                                    right: 25.w,
                                                    top: 25.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const DashboardBigTextWidgets(
                                                        title: 'WorkSpace'),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Overseer.viewVisi6 =
                                                              false;
                                                        });
                                                      },
                                                      child: Text(
                                                        "View All",
                                                        style: TextStyle(
                                                            color: Overseer
                                                                .blackColors,
                                                            fontSize: 18.sp),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const DashboardWorkSpaceDataTable(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
  }
}