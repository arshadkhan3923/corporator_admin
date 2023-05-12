import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';

class DashboardTextWidgets extends StatelessWidget {
  final String title;
  const DashboardTextWidgets({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Text(title,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: Overseer.grayColors,
      ),
    );
  }
}
