import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../DownloadActivityScreen/DownloadUserOverviewScreen/download_overview_screen_text.dart';

class OverviewMemoryQuotaScreen extends StatefulWidget {
  const OverviewMemoryQuotaScreen({
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
                        OverviewTextWidget(title: "Name"),
                        SizedBox(height: 10.h,),
                        OverviewTextWidget(title: "Email"),
                        SizedBox(height: 10.h,),
                        OverviewTextWidget(title: "Decrypt"),
                        SizedBox(height: 10.h,),
                        OverviewTextWidget(title: "Updated Date"),
                      ],
                    ),
                    SizedBox(width: 250.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OverviewTextWidget(title: ".name"),
                        SizedBox(height: 10.h,),
                        OverviewTextWidget(title:" .email"),
                        SizedBox(height: 10.h,),
                        OverviewTextWidget(title: ".decrypt"),
                        SizedBox(height: 10.h,),
                        OverviewTextWidget(title: ".updatedAt"),
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