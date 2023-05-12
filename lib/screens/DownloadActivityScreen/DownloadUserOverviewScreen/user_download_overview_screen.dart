import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import 'DownloadSettingScreen/download_setting_screen.dart';
import 'download_overview_screen.dart';

class ViewDownloadScreen extends StatefulWidget {
  final Function() notifyParent;
  String? name;

  String? activity;
  String? createDate;
  String? image;
    ViewDownloadScreen({Key? key,
     required this.notifyParent,
     this.name,

     this.activity,
     this.createDate,
     this.image,
  }) : super(key: key);
  @override
  State<ViewDownloadScreen> createState() => _ViewDownloadScreenState();
}
class _ViewDownloadScreenState extends State<ViewDownloadScreen> {
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
                      children: [
                        IconButton(
                            onPressed: () {
                              print("********************************************************");
                              Overseer.viewVisi = false;
                              Overseer.editVisi = false;
                              widget.notifyParent();
                            },
                            icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                        CircleAvatar(
                          radius: 40.r,
                          backgroundImage:  AssetImage(
                            widget.image.toString(),
                          ),
                        ),
                        SizedBox(width: 15.w,),
                        Text(widget.name.toString(),
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
              _isListVisible == 1 ? OverviewDownloadScreen(
                name: widget.name,

                activity: widget.activity,
                createDate: widget.createDate,
              ) :
              // _isListVisible == 2 ? const ActivitiesScreen() :
              _isListVisible == 3 ? const DownloadSettingScreen() : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
