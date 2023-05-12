import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../AppLayers/Streaming/Overseer.dart';
import '../../utils/app_images.dart';
import '../Auth/login/login_screen.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(top: 5.h,bottom: 5.h),
      child: InkWell(
        onTap: (){
          _showPopupMenu(context);
        },
        child: CircleAvatar(
          radius: 30.r,
          backgroundImage: const AssetImage(AppImages.profileImage),
        ),
      ),
    );
  }
  void _showPopupMenu(BuildContext context) async {
    final RenderBox? overlay = Overlay.of(context).context.findRenderObject() as RenderBox?;
    if (overlay == null) {
      return;
    }

    final screenSize = MediaQuery.of(context).size;
    final buttonSize = context.findRenderObject()?.paintBounds.size;

    final position = RelativeRect.fromRect(
      Rect.fromPoints(
        Offset(screenSize.width - buttonSize!.width, 0),
        Offset(screenSize.width, buttonSize.height),
      ),
      Offset.zero & screenSize,
    );
    await showMenu(
      color: Colors.white,
      context: context,
      position: position,
      items: [
        PopupMenuItem(
          child: Padding(
            padding:  EdgeInsets.only(top: 10.h,bottom: 10.h),
            child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         CircleAvatar(
                            radius: 55.r,
                            backgroundImage:const AssetImage(AppImages.profileImage,)),
                        SizedBox(width: 50.w,),
                        const MyHomePage(),
                      ],
                    ),
                    Text('Name',
                      style: TextStyle(
                        color: Overseer.bgColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),),
                    Text('Email',
                      style: TextStyle(
                        color: Overseer.bgColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),),
                  ],
                )),
          ),
        ),
        PopupMenuItem(
          child: Text('Account details',
            style: TextStyle(
              color: Overseer.bgColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),),
        ),
        PopupMenuItem(
          value: 3,
          child: TextFormField(
            style: const TextStyle(
              color: Overseer.blackColors,
            ),
            readOnly: true,
            // controller: emailController,
            autofocus: false,
            onChanged: (value){
              // verifyForgetPasswordManager.inEmail.add(value);
            },
            decoration: InputDecoration(
              // errorText: snapshot.error == null
              //     ? ""
              //     : snapshot.error.toString(),
              labelStyle:  TextStyle(
                  color: Colors.grey,fontSize: 16.sp,
                  fontWeight: FontWeight.w400),
              fillColor: Overseer.whiteColors,
              filled: true,
              labelText: 'Full Name',
            ),
          ),
        ),
        PopupMenuItem(
          value: 4,
          child: TextFormField(
            style: const TextStyle(
              color: Overseer.blackColors,
            ),
            readOnly: true,
            // controller: emailController,
            autofocus: false,
            onChanged: (value){
              // verifyForgetPasswordManager.inEmail.add(value);
            },
            decoration: InputDecoration(

              // errorText: snapshot.error == null
              //     ? ""
              //     : snapshot.error.toString(),
              labelStyle:  TextStyle(
                  color: Colors.grey,fontSize: 16.sp,
                  fontWeight: FontWeight.w400),
              fillColor: Overseer.whiteColors,
              filled: true,
              labelText: 'Email Address',
            ),
          ),
        ),
        PopupMenuItem(
          value: 5,
          child: TextFormField(
            style: const TextStyle(
              color: Overseer.blackColors,
            ),
            readOnly: true,
            // controller: emailController,
            autofocus: false,
            onChanged: (value){
              // verifyForgetPasswordManager.inEmail.add(value);
            },
            decoration: InputDecoration(

              // errorText: snapshot.error == null
              //     ? ""
              //     : snapshot.error.toString(),
              labelStyle:  TextStyle(
                  color: Colors.grey,fontSize: 16.sp,
                  fontWeight: FontWeight.w400),
              fillColor: Overseer.whiteColors,
              filled: true,
              labelText: 'Phone Number',
            ),
          ),
        ),
        // PopupMenuItem(
        //   value: 6,
        //   child: TextFormField(
        //     style: const TextStyle(
        //       color: Overseer.blackColors,
        //     ),
        //     readOnly: true,
        //     // controller: emailController,
        //     autofocus: false,
        //     onChanged: (value){
        //       // verifyForgetPasswordManager.inEmail.add(value);
        //     },
        //     decoration: InputDecoration(
        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(15.r),
        //         borderSide: BorderSide(color: Colors.black,width: 1.w),
        //       ),
        //       // errorText: snapshot.error == null
        //       //     ? ""
        //       //     : snapshot.error.toString(),
        //       labelStyle:  TextStyle(
        //           color: Colors.grey,fontSize: 16.sp,
        //           fontWeight: FontWeight.w400),
        //       fillColor: Overseer.whiteColors,
        //       filled: true,
        //       labelText: 'enter email',
        //     ),
        //   ),
        // ),
        PopupMenuItem(
          value: 7,
          child:  Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Overseer.bgColor),
                onPressed: () async {
                  SharedPreferences sharedP = await SharedPreferences.getInstance();
                  sharedP.remove('access_token');
                  Get.offAll(LoginScreen());
                  Get.snackbar(
                    "Message",
                    "Successfully Logout",
                    dismissDirection:
                    DismissDirection.horizontal,
                    isDismissible: true,
                    backgroundColor:Colors.orangeAccent,
                    duration: const Duration(seconds: 3),
                    icon: const Icon(Icons.error_outline,
                      color: Colors.red,
                    ),
                  );
                }, child:  Text("Logout",
              style: TextStyle(
                color: Overseer.whiteColors,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        ),
      ],
      elevation: 10.0,
    );
  }
}
