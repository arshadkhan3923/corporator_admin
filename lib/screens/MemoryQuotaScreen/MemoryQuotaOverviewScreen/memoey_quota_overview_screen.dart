import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import 'MemoryQuotaActivitiesScreen/memoey_quota_activities_screen.dart';
import 'MemoryQuotaSettingScreen/memoey_quota_setting_screen.dart';
import 'overview_memoey_quota_screen.dart';

class ViewUserMemoryQuotaScreen extends StatefulWidget {

   const ViewUserMemoryQuotaScreen({Key? key,

  }) : super(key: key);
  @override
  State<ViewUserMemoryQuotaScreen> createState() => _EditUserDownloadScreenState();
}
class _EditUserDownloadScreenState extends State<ViewUserMemoryQuotaScreen> {
  final _formKey = GlobalKey<FormState>();
  get index => 0;
  int _isListVisible = 1;
  @override
  Widget build(BuildContext context,) {
    return  Form(
      key: _formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(30.h),
                margin: EdgeInsets.all(30.h),
                decoration: BoxDecoration(
                  color: Overseer.bgColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40.r,
                          backgroundImage: const AssetImage(
                            "assets/images/profile.png",
                          ),
                        ),
                        SizedBox(width: 15.w,),
                        Text("Arshad Khan",
                          style: TextStyle(
                            color: Overseer.whiteColors,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                          ),),
                      ],
                    ),
                    SizedBox(height: 30.h,),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isListVisible = 1;
                            });
                          },
                          child: Container(
                            height: 40.h,
                            width: 113.w,
                            decoration: BoxDecoration(
                              color: _isListVisible == 1
                                  ? Overseer.whiteColors
                                  : Overseer.bgColor,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                color: _isListVisible == 1
                                    ? Overseer.bgColor
                                    : Overseer.whiteColors,
                                width: 1.5,
                              ),
                            ),
                            child: Center(
                              child: Text('Overview',
                                style: TextStyle(
                                  color: _isListVisible == 1
                                      ? Overseer.bgColor
                                      : Overseer.whiteColors,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w,),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isListVisible = 2;
                            });
                          },
                          child: Container(
                            height: 40.h,
                            width: 113.w,
                            decoration: BoxDecoration(
                              color: _isListVisible == 2
                                  ? Overseer.whiteColors
                                  : Overseer.bgColor,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                color: _isListVisible == 2
                                    ? Overseer.bgColor
                                    : Overseer.whiteColors,
                                width: 1.5,
                              ),
                            ),
                            child: Center(
                              child: Text('Activities',
                                style: TextStyle(
                                  color: _isListVisible == 2
                                      ? Overseer.bgColor
                                      : Overseer.whiteColors,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w,),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isListVisible = 3;
                            });
                          },
                          child: Container(
                            height: 40.h,
                            width: 113.w,
                            decoration: BoxDecoration(
                              color: _isListVisible == 3
                                  ? Overseer.whiteColors
                                  : Overseer.bgColor,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                color: _isListVisible == 3
                                    ? Overseer.bgColor
                                    : Overseer.whiteColors,
                                width: 1.5,
                              ),
                            ),
                            child: Center(
                              child: Text('Setting',
                                style: TextStyle(
                                  color: _isListVisible == 3
                                      ? Overseer.bgColor
                                      : Overseer.whiteColors,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w,),
                      ],
                    ),
                  ],
                ),
              ),
              _isListVisible == 1 ? OverviewMemoryQuotaScreen() :
              _isListVisible == 2 ? const MemoryQuotaActivitiesScreen() :
              _isListVisible == 3 ? const MemoryQuotaSettingScreen() : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
