import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../RoleScreens/Widgets/dashboard_big_text_widgets.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 770.h,
        width: 1158.w,
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
        child: const DashboardBigTextWidgets(title: 'Security screen'));
  }
}
