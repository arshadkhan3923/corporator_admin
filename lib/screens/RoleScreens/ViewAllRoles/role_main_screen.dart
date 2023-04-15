import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import 'roles_data_table_screen.dart';
import '../Widgets/dashboard_big_text_widgets.dart';
class RolesMainScreen extends StatelessWidget {
  const RolesMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardBigTextWidgets(title: 'Roles'),
        SizedBox(height: 30.h,),
        Container(
          decoration: BoxDecoration(
            color: Overseer.whiteColors,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 30.w,right: 20.w,top: 25.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DashboardBigTextWidgets(title: 'All Roles'),
                   SizedBox(height: 20.h),
                   const RolesDataTable(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
