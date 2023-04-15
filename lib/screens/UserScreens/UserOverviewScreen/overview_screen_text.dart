import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
class OverviewTextWidget extends StatelessWidget {
  String title;
   OverviewTextWidget({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(title,
      style: TextStyle(
        color: Overseer.bgColor,
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      ),);
  }
}
