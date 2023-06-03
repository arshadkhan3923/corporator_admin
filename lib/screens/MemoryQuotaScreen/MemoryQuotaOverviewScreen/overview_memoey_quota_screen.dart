import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../RoleScreens/RoleUserOverviewScreen/role_overview_screen_text.dart';

// ignore: must_be_immutable
class OverviewMemoryQuotaScreen extends StatefulWidget {
  String? userName;
  String? packName;
  String? maxSpace;
  String? duration;
  String? image;
  OverviewMemoryQuotaScreen({
    this.userName,
    this. packName,
    this.maxSpace,
    this. duration,
    this. image,
    Key? key,
  }) : super(key: key);

  @override
  State<OverviewMemoryQuotaScreen> createState() => _OverviewDownloadScreenState();
}
class _OverviewDownloadScreenState extends State<OverviewMemoryQuotaScreen> {
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
                        OverviewTextWidget(title: "User Name"),
                        SizedBox(height: 10.h,),
                        OverviewTextWidget(title: "Package Name"),
                        SizedBox(height: 10.h,),
                        OverviewTextWidget(title: "MaxSpace"),
                        SizedBox(height: 10.h,),
                        OverviewTextWidget(title: "Duration"),
                      ],
                    ),
                    SizedBox(width: 250.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OverviewTextWidget(title: widget.userName!),
                        SizedBox(height: 10.h,),
                        OverviewTextWidget(title:widget.packName!),
                        SizedBox(height: 10.h,),
                        OverviewTextWidget(title: widget.maxSpace!),
                        SizedBox(height: 10.h,),
                        OverviewTextWidget(title: widget.duration!),
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