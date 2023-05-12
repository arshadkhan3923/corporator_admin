import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import 'SpecificActivitiesScreen/activities_screen.dart';
import '../UserOverviewScreen/overview_screen.dart';
import 'UserSettingScreen/setting_screen.dart';

// ignore: must_be_immutable
class ViewUserScreen extends StatefulWidget {
  final Function() notifyParent;
  int? id;
  String? name;
  String? email;
  String? address;
  String? phoneNo;
  String? zipcode;
  String? purpose;
  String? image;
  String? joiningDate;
  ViewUserScreen({Key? key,
     this.id,
    this.name,
    this.email,
    this.address,
    this.phoneNo,
    this.zipcode,
    this.purpose,
    this.image,
    this.joiningDate,
    required this.notifyParent,
  }) : super(key: key);
  @override
  State<ViewUserScreen> createState() => _ViewUserScreenState();
}
class _ViewUserScreenState extends State<ViewUserScreen> {
  get index => 0;
  int _isListVisible = 1;
  @override
  Widget build(BuildContext context,) {
    return  Expanded(
      flex: 5,
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
                    IconButton(
                        onPressed: () {
                          Overseer.viewVisi = false;
                          Overseer.editVisi = false;
                          widget.notifyParent();
                        },
                        icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                    CircleAvatar(
                      radius: 50.r,
                      backgroundImage:  NetworkImage(
                        widget.image.toString(),
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
            address: widget.address,
            phoneNo: widget.phoneNo,
            zipCode: widget.zipcode,
            purpose: widget.purpose,
            joiningDate: widget.joiningDate?.substring(0,10),
          ) :
          _isListVisible == 2 ? const SpecificActivitiesScreen() :
          _isListVisible == 3 ? const UserSettingScreen() : Container(),
        ],
      ),
    );
  }
}