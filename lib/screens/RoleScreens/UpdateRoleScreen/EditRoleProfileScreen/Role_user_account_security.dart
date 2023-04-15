import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../AppLayers/Streaming/Overseer.dart';

class DownloadAccountSecurity extends StatefulWidget {
  const DownloadAccountSecurity({Key? key}) : super(key: key);
  @override
  State<DownloadAccountSecurity> createState() => _DownloadAccountSecurityState();
}
class _DownloadAccountSecurityState extends State<DownloadAccountSecurity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w,right: 20.w),
      decoration: BoxDecoration(
          color: Overseer.whiteColors,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r),
          )
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: 30.w,right: 30.w,top: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Change Password',
              style: TextStyle(
                color:  Overseer.bgColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 30.h,),
            TextFormField(
              style: const TextStyle(
                color: Overseer.blackColors,
              ),
              // controller: forgetPasswordController,
              onChanged: (value){
                // forgetPasswordManager.inEmail.add(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide(color: Colors.black,width: 1.w),
                ),
                errorStyle:
                TextStyle(color: Colors.grey,
                  fontSize: 18.sp,
                ),
                labelStyle:  TextStyle(
                    color: Colors.grey,fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
                fillColor: Overseer.whiteColors,
                filled: true,
                // errorText: snapshot.error == null
                //     ? ""
                //     : snapshot.error.toString(),
                labelText: 'Old Password',
              ),
            ),
            SizedBox(height: 10.h,),
            TextFormField(
              style: const TextStyle(
                color: Overseer.blackColors,
              ),
              // controller: forgetPasswordController,
              onChanged: (value){
                // forgetPasswordManager.inEmail.add(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide(color: Colors.black,width: 1.w),
                ),
                errorStyle:
                TextStyle(color: Colors.grey,
                  fontSize: 18.sp,
                ),
                labelStyle:  TextStyle(
                    color: Colors.grey,fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                ),
                fillColor: Overseer.whiteColors,
                filled: true,
                // errorText: snapshot.error == null
                //     ? ""
                //     : snapshot.error.toString(),
                labelText: 'New Password',
              ),
            ),
            SizedBox(height: 10.h,),
            TextFormField(
              style: const TextStyle(
                color: Overseer.blackColors,
              ),
              // controller: forgetPasswordController,
              onChanged: (value){
                // forgetPasswordManager.inEmail.add(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide(color: Colors.black,width: 1.w),
                ),
                errorStyle:
                TextStyle(color: Colors.grey,
                  fontSize: 18.sp,
                ),
                labelStyle:  TextStyle(
                    color: Colors.grey,fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
                fillColor: Overseer.whiteColors,
                filled: true,
                // errorText: snapshot.error == null
                //     ? ""
                //     : snapshot.error.toString(),
                labelText: 'Confirm Password',
              ),
            ),
            SizedBox(height: 25.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 50.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Overseer.whiteColors,
                    border: Border.all(color: Overseer.bgColor),
                  ),
                  child: Center(
                    child: Text('Cancel',
                      style: TextStyle(
                        color:  Overseer.bgColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w,),
                Container(
                  height: 50.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                    color: Overseer.bgColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text('Update',
                      style: TextStyle(
                        color:  Overseer.whiteColors,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h,),
          ],
        ),
      ),
    );
  }
}
