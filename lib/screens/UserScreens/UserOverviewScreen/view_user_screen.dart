import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import 'UserActivityScreen/activities_screen.dart';
import '../UserOverviewScreen/overview_screen.dart';
import 'UserSettingScreen/setting_screen.dart';

// ignore: must_be_immutable
class ViewUserScreen extends StatefulWidget {
  int id;
  String? name;
  String? email;
  String? address;
  String? phoneNo;
  String? zipcode;
  String? purpose;
  String? joiningDate;
   ViewUserScreen({Key? key,
     required this.id,
     this.name,
     this.email,
     this.address,
     this.phoneNo,
     this.zipcode,
     this.purpose,

     this.joiningDate,
  }) : super(key: key);
  @override
  State<ViewUserScreen> createState() => _ViewUserScreenState();
}
class _ViewUserScreenState extends State<ViewUserScreen> {
  get index => 0;
  int _isListVisible = 1;
  @override
  Widget build(BuildContext context,) {
    return  Scaffold(
      body: Column(
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
                    Text(widget.name!,
                      style: TextStyle(
                        color: Overseer.whiteColors,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
          _isListVisible == 1 ? OverviewScreen(
            id: widget.id,
            name: widget.name,
            email: widget.email,
            joiningDate: widget.joiningDate?.substring(0,10),
          ) :
          _isListVisible == 2 ? const ActivitiesScreen() :
          _isListVisible == 3 ? const SettingScreen() : Container(),
        ],
      ),
    );
  }
}
