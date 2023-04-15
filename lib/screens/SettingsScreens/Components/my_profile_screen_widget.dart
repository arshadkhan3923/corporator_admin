import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../RoleScreens/Widgets/dashboard_big_text_widgets.dart';
class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        height: 770.h,
        width: 1158.w,
        color: Colors.white,
        child: const DashboardBigTextWidgets(title: 'My Profile Screen'));
  }
}
