import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../RoleScreens/Widgets/dashboard_big_text_widgets.dart';
import '../GetAllDownloadsActivity/all_downloads_activity.dart';
import '../GetAllRevenueScreen/all_revenue_screen.dart';
import '../GetAllUploadActivity/get_all_upload_activity.dart';
import '../GetAllUsers/all_User_main_screen.dart';
import '../Widgets/chart_text_widget.dart';
import '../Widgets/second_chart_widget.dart';
import 'dashboard_role_data_table.dart';
import 'dashboard_user_data_table_.dart';
import 'dashboard_workspace_data_table_.dart';

class DashboardMainScreen extends StatelessWidget{
  const DashboardMainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardBigTextWidgets(title: 'Dashboard',),
        SizedBox(height: 30.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:const [
            AllUserScreen(),
            AllRevenueScreen(),
            AllDownloadsActivity(),
            AllUploadActivity(),
          ],
        ),
        SizedBox(height: 30.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 325.h,
              width: 550.w,
              decoration: BoxDecoration(
                color: Overseer.whiteColors,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 25.w,right: 25.w,top: 25.h),
                      child: const DashboardBigTextWidgets(title: 'Roles'),
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
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding:  EdgeInsets.only(left: 30.w,right: 30.w,top: 25.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Revenue',
                            style: TextStyle(
                                color: Overseer.bgColors,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Text('\$124,5970',
                            style: TextStyle(
                                color: Overseer.bgColors,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      const SecondChartWidgets(),
                      SizedBox(height: 5.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          ChartTextWidget(title: 'JAN',),
                          ChartTextWidget(title: 'FEB',),
                          ChartTextWidget(title: 'MAR',),
                          ChartTextWidget(title: 'APR',),
                          ChartTextWidget(title: 'MAY',),
                          ChartTextWidget(title: 'JUN',),
                          ChartTextWidget(title: 'JULY',),
                          ChartTextWidget(title: 'AUG',),
                          ChartTextWidget(title: 'SEP',),
                          ChartTextWidget(title: 'OCT',),
                          ChartTextWidget(title: 'NOV',),
                          ChartTextWidget(title: 'DEC',),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 30.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 550.w,
              height: 325.h,
              decoration: BoxDecoration(
                color: Overseer.whiteColors,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 25.w,right: 25.w,top: 25.h),
                      child: const DashboardBigTextWidgets(title: 'Users'),
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
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 25.w,right: 25.w,top: 25.h),
                      child: const DashboardBigTextWidgets(title: 'WorkSpace'),
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
