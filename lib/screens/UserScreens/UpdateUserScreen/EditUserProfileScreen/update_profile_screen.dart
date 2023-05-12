import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../AppLayers/Streaming/Overseer.dart';
import '../../../../Widgets/edit_picture.dart';
import '../update_user_information.dart';

class EditUserProfileScreen extends StatefulWidget {
  final Function() notifyParent;
  int? id;
  String? name;
  String? email;
  String? address;
  String? phoneNo;
  String? zipCode;
  String? purpose;
  String? image;
   EditUserProfileScreen({Key? key,
     this.id,
    this.name,
    this.email,
     this.address,
    this.phoneNo,
    this.zipCode,
    this.purpose,
     required this.
     notifyParent,
     this.image
  }) : super(key: key);
  @override
  State<EditUserProfileScreen> createState() => _EditUserProfileScreenState();
}
class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
  File? image;
  int _isListVisible = 1;
  @override
  Widget build(BuildContext context) {

    return  Expanded(flex: 5,
      child: SingleChildScrollView(
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
                    IconButton(
                        onPressed: () {
                          print("********************************************************");
                          Overseer.viewVisi = false;
                          Overseer.editVisi = false;
                          widget.notifyParent();
                        },
                        icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                    AvatarPicker(
                      size: 100.0,
                      onImageSelected: (File images) {
                        setState(() {
                          image = File(images.path);
                        });
                      },
                      defaultImage: widget.image.toString(),
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
                        // InkWell(
                        //   onTap: () {
                        //     setState(() {
                        //       _isListVisible = 2;
                        //     });
                        //   },
                        //   child: Container(
                        //     height: 50.h,
                        //     width: 180.w,
                        //     decoration: BoxDecoration(
                        //       color: _isListVisible == 2
                        //           ? Overseer.bgColor
                        //           : Overseer.whiteColors,
                        //     ),
                        //     child: Center(
                        //       child: Text("Account Security",
                        //         style: TextStyle(
                        //           color: _isListVisible == 2
                        //               ? Overseer.whiteColors
                        //               : Overseer.bgColor,
                        //           fontSize: 18.sp,
                        //           fontWeight: FontWeight.w500,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Divider(height: 1.h,color: Overseer.grayColors,),
                ],
              ),
            ),
            _isListVisible == 1 ? UpdateUserInformation(
              id: widget.id.toString(),
              name: widget.name,
              email: widget.email,
              address: widget.address,
              phoneNo: widget.phoneNo,
              zipcode: widget.zipCode,
              purpose: widget.purpose,
              image: widget.image,
            ) :
            // _isListVisible == 2 ?
            // const UserAccountSecurity() :
            Container(),
          ],
        ),
      ),
    );
  }
}
