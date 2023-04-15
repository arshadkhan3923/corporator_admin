import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../DownloadActivityScreen/DownloadUserOverviewScreen/download_overview_screen_text.dart';

class OverviewWorkSpaceScreen extends StatefulWidget {
  const OverviewWorkSpaceScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OverviewWorkSpaceScreen> createState() => _OverviewDownloadScreenState();
}
class _OverviewDownloadScreenState extends State<OverviewWorkSpaceScreen> {
  final _formKey = GlobalKey<FormState>();
  get index => 0;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 30.w, top: 25.h),
            margin: EdgeInsets.all(30.h),
            decoration: BoxDecoration(
              color: Overseer.whiteColors,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Info',
                  style: TextStyle(
                    color: Overseer.bgColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OverviewTextWidget(title: "Name"),
                        SizedBox(height: 16.h,),
                        OverviewTextWidget(title: "Total Storage"),
                        SizedBox(height: 16.h,),
                        OverviewTextWidget(title: "Storage Left"),
                        SizedBox(height: 16.h,),
                        OverviewTextWidget(title: "Updated Date"),
                      ],
                    ),
                    SizedBox(width: 250.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OverviewTextWidget(title: "Flutter App"),
                        SizedBox(height: 16.h,),
                        OverviewTextWidget(title:" 50GB"),
                        SizedBox(height: 16.h,),
                        OverviewTextWidget(title: "20Gb"),
                        SizedBox(height: 16.h,),
                        OverviewTextWidget(title: "05/04/2023"),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: 40.h,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
