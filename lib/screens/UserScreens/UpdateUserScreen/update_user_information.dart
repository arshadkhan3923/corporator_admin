import 'package:corporator_admin/screens/UserScreens/UpdateUserScreen/userUpdate_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';

// ignore: must_be_immutable
class EditUserInformation extends StatefulWidget {
  String id;
  String? name;
  String? email;
  String? address;
  String? phoneNo;
  String? zipcode;
  String? purpose;
   EditUserInformation({Key? key,
    required this.id,
    this.name,
    this.email,
    this.address,
    this.phoneNo,
    this.zipcode,
    this.purpose,
  }) : super(key: key);
  @override
  State<EditUserInformation> createState() => _EditUserInformationState();
}
class _EditUserInformationState extends State<EditUserInformation> {
  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNoController = TextEditingController();
  final zipCodeController = TextEditingController();
  final purposeController = TextEditingController();
  get index => 0;
  @override
  void initState() {
    userNameController.text= widget.name!;
    emailController.text= widget.email!;
    emailController.text= widget.address!;
    emailController.text= widget.phoneNo!;
    emailController.text= widget.zipcode!;
    emailController.text= widget.purpose!;
    super.initState();
  }
  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    addressController.dispose();
    phoneNoController.dispose();
    zipCodeController.dispose();
    purposeController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    UpdateUserManager updateUserManager = Provider.of(context).fetch(UpdateUserManager);
    // updateUserManager.inName.add(widget.name!);
    // updateUserManager.inEmail.add(widget.email!);
    // updateUserManager.inAddress.add(widget.address!);
    // updateUserManager.inPhoneNo.add(widget.phoneNo!);
    // updateUserManager.inZipCode.add(widget.zipcode!);
    // updateUserManager.inPurpose.add(widget.purpose!);
    return Form(
      key: _formKey,
      child: Container(
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
              Text('Personal Information',
                style: TextStyle(
                  color:  Overseer.bgColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 30.h,),
              StreamBuilder<Object>(
                stream: updateUserManager.name$,
                builder: (context, snapshot) {
                  return TextFormField(
                    style: const TextStyle(
                      color: Overseer.blackColors,
                    ),
                    controller: userNameController ,
                    onChanged: (value){
                      updateUserManager.inName.add(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide(color: Colors.black,width: 1.w),
                      ),
                      labelStyle:  TextStyle(
                          color: Colors.grey,fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                      fillColor: Overseer.whiteColors,
                      filled: true,
                      errorText: snapshot.error == null
                          ? ""
                          : snapshot.error.toString(), labelText: 'Full Name',
                    ),
                  );
                }
              ),
              StreamBuilder<Object>(
                stream: updateUserManager.email$,
                builder: (context, snapshot) {
                  return TextFormField(
                    style: const TextStyle(
                      color: Overseer.blackColors,
                    ),
                    controller: emailController,
                    onChanged: (value){
                      updateUserManager .inEmail.add(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide(color: Colors.black,width: 1.w),
                      ),
                      labelStyle:  TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                      ),
                      fillColor: Overseer.whiteColors,
                      filled: true,
                      errorText: snapshot.error == null
                          ? ""
                          : snapshot.error.toString(),
                      labelText: 'Email',
                    ),
                  );
                }
              ),
              StreamBuilder<Object>(
                  stream: updateUserManager.address$,
                  builder: (context, snapshot) {
                    return TextFormField(
                      style: const TextStyle(
                        color: Overseer.blackColors,
                      ),
                      controller: addressController,
                      onChanged: (value){
                        updateUserManager .inAddress.add(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(color: Colors.black,width: 1.w),
                        ),
                        labelStyle:  TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        fillColor: Overseer.whiteColors,
                        filled: true,
                        errorText: snapshot.error == null
                            ? ""
                            : snapshot.error.toString(),
                        labelText: 'Address',
                      ),
                    );
                  }
              ),
              StreamBuilder<Object>(
                  stream: updateUserManager.phoneNo$,
                  builder: (context, snapshot) {
                    return TextFormField(
                      style: const TextStyle(
                        color: Overseer.blackColors,
                      ),
                      controller: phoneNoController,
                      onChanged: (value){
                        updateUserManager .inPhoneNo.add(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(color: Colors.black,width: 1.w),
                        ),
                        labelStyle:  TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        fillColor: Overseer.whiteColors,
                        filled: true,
                        errorText: snapshot.error == null
                            ? ""
                            : snapshot.error.toString(),
                        labelText: 'Phone No',
                      ),
                    );
                  }
              ),
              StreamBuilder<Object>(
                  stream: updateUserManager.zipCode$,
                  builder: (context, snapshot) {
                    return TextFormField(
                      style: const TextStyle(
                        color: Overseer.blackColors,
                      ),
                      controller: zipCodeController,
                      onChanged: (value){
                        updateUserManager .inZipCode.add(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(color: Colors.black,width: 1.w),
                        ),
                        labelStyle:  TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        fillColor: Overseer.whiteColors,
                        filled: true,
                        errorText: snapshot.error == null
                            ? ""
                            : snapshot.error.toString(),
                        labelText: 'ZipCode',
                      ),
                    );
                  }
              ),
              StreamBuilder<Object>(
                  stream: updateUserManager.purpose$,
                  builder: (context, snapshot) {
                    return TextFormField(
                      style: const TextStyle(
                        color: Overseer.blackColors,
                      ),
                      controller: purposeController,
                      onChanged: (value){
                        updateUserManager .inPurpose.add(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(color: Colors.black,width: 1.w),
                        ),
                        labelStyle:  TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        fillColor: Overseer.whiteColors,
                        filled: true,
                        errorText: snapshot.error == null
                            ? ""
                            : snapshot.error.toString(),
                        labelText: 'Purpose',
                      ),
                    );
                  }
              ),
              SizedBox(height: 50.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 50.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                        color: Overseer.whiteColors,
                        border: Border.all(color: Overseer.bgColor),
                        borderRadius: BorderRadius.circular(10.r),
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
                  ),
                  SizedBox(width: 10.w,),
                  StreamBuilder<Object>(
                      stream: updateUserManager.isUserFormValid$,
                      builder: (context, snapshot) {
                        return InkWell(
                          onTap: () {
                            Overseer.updateUserId = widget.id;
                              print("submit${Overseer.updateUserId}");
                            if (snapshot.hasData == true){
                              showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  );
                                },
                                barrierDismissible: false,
                              );
                              updateUserManager.isUserFormSubmit$.listen((event) {}
                              ).onDone(() {
                                Navigator.of(context).pop();
                                if (Overseer.statusCode == '200') {
                                  Navigator.pop(context);
                                }
                              });
                            } else {
                              if (snapshot.error == null) {
                                Get.snackbar(
                                  "Error",
                                  "Fill the form Properly",
                                  colorText: Overseer.whiteColors,
                                  dismissDirection: DismissDirection.horizontal,
                                  isDismissible: true,
                                  backgroundColor: Colors.orangeAccent,
                                  duration: const Duration(seconds: 3),
                                  icon: const Icon(
                                    Icons.error_outline,
                                    color: Colors.red,
                                  ),
                                );
                              } else {
                                Get.snackbar(
                                  colorText: Colors.red,
                                  "Error",
                                  "${snapshot.error}",
                                  dismissDirection: DismissDirection.horizontal,
                                  isDismissible: true,
                                  backgroundColor: Colors.orangeAccent,
                                  duration: const Duration(seconds: 3),
                                  icon: const Icon(
                                    Icons.error_outline,
                                    color: Colors.red,
                                  ),
                                );
                              }
                            }
                          },
                          child:  Container(
                            height: 50.h,
                            width: 140.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Overseer.bgColor,
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
                        );
                      }),
                ],
              ),
              SizedBox(height: 20.h,),
            ],
          ),
        ),
      ),
    );
  }
}
