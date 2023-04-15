import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../AppLayers/Streaming/Overseer.dart';

class AlertDialogOneWidget extends StatelessWidget {
  final String title;

  const AlertDialogOneWidget({Key? key, required this.title,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(title,
            style: TextStyle(
                color: Overseer.textColors,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}
class AlertDialogTwoWidget extends StatelessWidget {
  final String title;

  const AlertDialogTwoWidget({Key? key, required this.title,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(title,
            style: TextStyle(
                color: Overseer.grayColors,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400
            ),
          ),

        ],
      ),
    );
  }
}
