import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../AppLayers/Streaming/Overseer.dart';
import '../../../../Widgets/edit_picture.dart';
import '../role_update_screen.dart';
import 'Role_user_account_security.dart';

class UpdateRoleScreen extends StatefulWidget {
  const UpdateRoleScreen({Key? key,

  }) : super(key: key);
  @override
  State<UpdateRoleScreen> createState() => _EditUserScreenState();
}
class _EditUserScreenState extends State<UpdateRoleScreen> {
  final _formKey = GlobalKey<FormState>();
   File? image;
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
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AvatarPicker(
                        size: 100.0,
                        onImageSelected: (File images) {
                          setState(() {
                            image = File(images.path);
                          });
                        },
                        defaultImage: 'https://via.placeholder.com/150',
                      ),
                      SizedBox(width: 15.w,),
                      Text("Arshad Khan",
                        style: TextStyle(
                          color: Overseer.whiteColors,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 20.w,right: 20.w),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Overseer.whiteColors,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                _isListVisible = 1;
                              });
                            },
                            child: Container(
                              height: 50.h,
                              width: 180.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                ),
                                color: _isListVisible == 1
                                    ? Overseer.bgColor
                                    : Overseer.whiteColors,
                              ),
                              child: Center(
                                child: Text("Personal Information",
                                  style: TextStyle(
                                    color: _isListVisible == 1
                                        ? Overseer.whiteColors
                                        : Overseer.bgColor,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _isListVisible = 2;
                              });
                            },
                            child: Container(
                              height: 50.h,
                              width: 180.w,
                              decoration: BoxDecoration(
                                color: _isListVisible == 2
                                    ? Overseer.bgColor
                                    : Overseer.whiteColors,
                              ),
                              child: Center(
                                child: Text("Account Security",
                                  style: TextStyle(
                                    color: _isListVisible == 2
                                        ? Overseer.whiteColors
                                        : Overseer.bgColor,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 1.h,color: Overseer.grayColors,),
                  ],
                ),
              ),
              _isListVisible == 1 ? const RoleUpdateInformation()
                  : _isListVisible == 2
                  ?
                  const DownloadAccountSecurity()
                  : Container(),
            ],
          )
        ),
      ),
    );
  }
}
