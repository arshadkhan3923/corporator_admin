import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../RoleScreens/Widgets/dashboard_big_text_widgets.dart';
import 'memory_quota_data_table_screen.dart';

class MemoryQuotaMainScreen extends StatelessWidget {
  const MemoryQuotaMainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardBigTextWidgets(title: 'Memory Quota ',),
        SizedBox(height: 30.h,),
        Container(
          decoration: BoxDecoration(
            color: Overseer.whiteColors,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding:  EdgeInsets.only(left: 30.w,right: 20.w,top: 25.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "All Memory Quota ",
                    style: TextStyle(
                        color: Overseer.textColors,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500
                    )
                ),
                SizedBox(height: 20.h),
                const MemoryQuotaDataTable(),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
