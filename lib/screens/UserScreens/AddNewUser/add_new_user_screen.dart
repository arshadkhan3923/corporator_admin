import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../AppLayers/Streaming/Provider.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../Widgets/Button.dart';
import '../../RoleScreens/Widgets/dashboard_big_text_widgets.dart';
import 'add_new_User_manager.dart';

class AddUserDataScreen extends StatefulWidget {
   const AddUserDataScreen({Key? key,}) : super(key: key);
  @override
  State<AddUserDataScreen> createState() => _AddUserDataScreenState();
}
class _AddUserDataScreenState extends State<AddUserDataScreen> {
  final _formKey=GlobalKey<FormState>();
  final _addressController=TextEditingController();
  final _phoneNumberController=TextEditingController();
  final _zipCodeController=TextEditingController();
  final _purposeController=TextEditingController();
  final _owenIdController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    AddNewUserManager addNewUserManager = Provider.of(context).fetch(AddNewUserManager);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DashboardBigTextWidgets(title: 'App User',),
          SizedBox(height: 30.h,),
          Container(
            decoration: BoxDecoration(
              color: Overseer.whiteColors,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 30.w, right: 20.w, top: 25.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Add New User",
                      style: TextStyle(
                          color: Overseer.textColors,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500
                      ),
                  ),
                  SizedBox(height: 20.h),
                  ///
                  Text("User Address",
                    style: TextStyle(
                      color: Overseer.blackColors,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  StreamBuilder<String>(
                    stream: addNewUserManager.userAddress$,
                    builder: (context, snapshot) {
                      return TextFormField(
                        style: const TextStyle(
                          color: Overseer.blackColors,
                        ),
                        controller: _addressController,
                        autofocus: false,
                        onChanged: (value) {
                          addNewUserManager.inUserAddress.add(value);
                        },
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                            borderSide: BorderSide(color: Colors.black, width: 1.w),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.grey, fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          labelText: 'User Address',
                          fillColor: Overseer.whiteColors,
                          errorText: snapshot.error == null
                              ? ""
                              : snapshot.error.toString(),
                          errorStyle:
                          TextStyle(color: Colors.black,
                            fontSize: 18.sp,
                          ),
                        ),
                      );
                    }
                  ),
                  ///
                  Text("User Email",
                    style: TextStyle(color: Overseer.blackColors,
                      fontSize: 18.sp, fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  StreamBuilder<String>(
                    stream: addNewUserManager.phoneNumber$,
                    builder: (context, snapshot) {
                      return TextFormField(
                        style: const TextStyle(
                          color: Overseer.blackColors,
                        ),
                        controller: _phoneNumberController,
                        autofocus: false,
                        onChanged: (value) {
                          addNewUserManager.inPhoneNumber.add(value);
                        },
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                            borderSide: BorderSide(color: Colors.black, width: 1.w),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.grey, fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          labelText: 'Email',
                          fillColor: Overseer.whiteColors,
                          errorText: snapshot.error == null
                              ? ""
                              : snapshot.error.toString(),
                          errorStyle:
                          TextStyle(color: Colors.black,
                            fontSize: 18.sp,
                          ),
                        ),
                      );
                    }
                  ),
                  ///
                  Text("User Zip Code",
                    style: TextStyle(color: Overseer.blackColors,
                      fontSize: 18.sp, fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  StreamBuilder<String>(
                      stream: addNewUserManager.userZipCode$,
                      builder: (context, snapshot) {
                        return TextFormField(
                          style: const TextStyle(
                            color: Overseer.blackColors,
                          ),
                          controller: _zipCodeController,
                          autofocus: false,
                          onChanged: (value) {
                            addNewUserManager.inUserZipCode.add(value);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide: BorderSide(color: Colors.black, width: 1.w),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey, fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            labelText: 'User Zip code',
                            fillColor: Overseer.whiteColors,
                            errorText: snapshot.error == null
                                ? ""
                                : snapshot.error.toString(),
                            errorStyle:
                            TextStyle(color: Colors.black,
                              fontSize: 18.sp,
                            ),
                          ),
                        );
                      }
                  ),
                  ///
                  Text("User Purpose",
                    style: TextStyle(color: Overseer.blackColors,
                      fontSize: 18.sp, fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  StreamBuilder<String>(
                    stream: addNewUserManager.userPurpose$,
                    builder: (context, snapshot) {
                      return TextFormField(
                        style: const TextStyle(
                          color: Overseer.blackColors,
                        ),
                        controller: _purposeController,
                        autofocus: false,
                        onChanged: (value) {
                          addNewUserManager.inUserPurpose.add(value);
                        },
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                            borderSide: BorderSide(color: Colors.black, width: 1.w),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.grey, fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          labelText: 'User Purpose',
                          fillColor: Overseer.whiteColors,
                          errorText: snapshot.error == null
                              ? ""
                              : snapshot.error.toString(),
                          errorStyle:
                          TextStyle(color: Colors.black,
                            fontSize: 18.sp,
                          ),
                        ),
                      );
                    }
                  ),
                  ///
                  Text("Owner Id",
                    style: TextStyle(color: Overseer.blackColors,
                      fontSize: 18.sp, fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  StreamBuilder<String>(
                    stream: addNewUserManager.ownerId$,
                    builder: (context, snapshot) {
                      return TextFormField(
                        style: const TextStyle(
                          color: Overseer.blackColors,
                        ),
                        controller: _owenIdController,
                        autofocus: false,
                        onChanged: (value) {
                          addNewUserManager.inOwnerId.add(value);
                        },
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                            borderSide: BorderSide(color: Colors.black, width: 1.w),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.grey, fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          labelText: 'Owner Id ',
                          fillColor: Overseer.whiteColors,
                          errorText: snapshot.error == null
                              ? ""
                              : snapshot.error.toString(),
                          errorStyle:
                          TextStyle(color: Colors.black,
                            fontSize: 18.sp,
                          ),
                        ),
                      );
                    }
                  ),
                  /// button
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      StreamBuilder<Object>(
                          stream: addNewUserManager.isFormAddNewUserValid$,
                          builder: (context, snapshot) {
                            return Button(title: 'Add New User',
                              bg: Overseer.bgColor,
                              onTap:(){
                                if(snapshot.hasData == true){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return  const Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                    barrierDismissible: false,
                                  );
                                  addNewUserManager.isFormAddNewUserSubmit$.listen((event) {})
                                      .onDone(() {
                                    Navigator.of(context).pop();
                                    if(Overseer.statusCode == '200'){
                                      Get.snackbar(
                                        "Congratulation",
                                        colorText: Overseer.whiteColors,
                                        backgroundColor: Overseer.secondaryColor,
                                        "User added successfully!",
                                        icon: const Icon(Icons.error_outline, color: Colors.white),
                                        snackPosition: SnackPosition.TOP,
                                      );
                                    }
                                  });
                                }else{
                                  if(snapshot.error == null){
                                    Get.snackbar(
                                      "Error",
                                      "Fill the form Properly",
                                      dismissDirection:
                                      DismissDirection.horizontal,
                                      isDismissible: true,
                                      backgroundColor:Colors.orangeAccent,
                                      duration: const Duration(seconds: 3),
                                      icon: const Icon(Icons.error_outline,
                                        color: Colors.red,
                                      ),
                                    );
                                  }else{
                                    Get.snackbar(
                                      "Error",
                                      "${snapshot.error}",
                                      dismissDirection:
                                      DismissDirection.horizontal,
                                      isDismissible: true,
                                      backgroundColor:Colors.orangeAccent,
                                      duration: const Duration(seconds: 3),
                                      icon: const Icon(Icons.error_outline,
                                        color: Colors.red,
                                      ),
                                    );
                                  }
                                }
                              },
                            );
                          }
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
