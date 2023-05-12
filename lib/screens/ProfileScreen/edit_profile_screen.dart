import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../AppLayers/Streaming/Overseer.dart';
import '../../Widgets/edit_picture.dart';
import '../../utils/app_images.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  File? image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showAlertDialog();
      },
      child: Container(
        height: 35.h,
        decoration: BoxDecoration(
          color: Overseer.bgColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 8.w,),
              Text("Edit Profile",
                style: TextStyle(
                  color: Overseer.whiteColors,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 4.w,),
              Icon(Icons.edit,
                color: Overseer.whiteColors,
                size: 20.sp,
              ),
              SizedBox(width: 8.w,),
            ],
          ),
        ),
      ),
    );
  }
  void showAlertDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 2.0,
            surfaceTintColor: Colors.red,
            scrollable: true,
            title: const Text("Edit Profile"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AvatarPicker(
                      size: 100.0,
                      onImageSelected: (File images) {
                        setState(() {
                          image = File(images.path);
                        });
                      },
                      defaultImage: AppImages.profileImage,
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),
                TextFormField(
                  style: const TextStyle(
                    color: Overseer.blackColors,
                  ),
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
                SizedBox(height: 10.h,),
                TextFormField(
                  style: const TextStyle(
                    color: Overseer.blackColors,
                  ),
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
                SizedBox(height: 10.h,),
                TextFormField(
                  style: const TextStyle(
                    color: Overseer.blackColors,
                  ),
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
                SizedBox(height: 10.h,),
                TextFormField(
                  style: const TextStyle(
                    color: Overseer.blackColors,
                  ),
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
              ],
            ),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel',
                    style: TextStyle(
                      color: Overseer.bgColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Overseer.bgColor),
                  onPressed: () {
                    // Write code to delete item
                  },
                  child: Text(
                    'Update',
                    style: TextStyle(
                      color: Overseer.whiteColors,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ),
            ],
          );
        });
  }
}