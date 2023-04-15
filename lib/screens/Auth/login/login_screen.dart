import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../Widgets/Button.dart';
import '../../main/main_screen.dart';
import '../ForgetPassword/forget_password_screen.dart';
import 'login_manager.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _passwordVisible = true;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    LoginFormManager manager = Provider.of(context).fetch(LoginFormManager);
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 90.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Overseer.blackColors,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  StreamBuilder<String>(
                      stream: manager.email$,
                      builder: (context, snapshot) {
                        return Center(
                          child: SizedBox(
                            width: 350.w,
                            child: TextFormField(
                              style: const TextStyle(
                                color: Overseer.blackColors,
                              ),
                              controller: emailController,
                              autofocus: false,
                              onChanged: (value) {
                                manager.inEmail.add(value);
                              },
                              decoration: InputDecoration(
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.w),
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                labelText: 'Email Address',
                                fillColor: Overseer.whiteColors,
                                errorText: snapshot.error == null
                                    ? ""
                                    : snapshot.error.toString(),
                                errorStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    height: 20.h,
                  ),
                  StreamBuilder<String>(
                      stream: manager.password$,
                      builder: (context, snapshot) {
                        return Center(
                          child: SizedBox(
                            width: 350.w,
                            child: TextFormField(
                              style: const TextStyle(
                                color: Overseer.blackColors,
                              ),
                              controller: passwordController,
                              autofocus: false,
                              obscureText: _passwordVisible,
                              onChanged: (value) {
                                manager.inPassword.add(value);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.w),
                                ),
                                errorStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18.sp,
                                ),
                                errorText: snapshot.error == null
                                    ? ""
                                    : snapshot.error.toString(),
                                labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                                fillColor: Overseer.whiteColors,
                                filled: true,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. google the state of passwordVisible variable
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                labelText: 'Password',
                              ),
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 250.w,
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.to(const ForgetPassword());
                      },
                      child: Text(
                        " Forgot Password?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  StreamBuilder<Object>(
                      stream: manager.isLoginFormValid$,
                      builder: (context, snapshot) {
                        return Button(
                          title: 'Login',
                          bg: Overseer.bgColor,
                          onTap: () {
                            if (snapshot.hasData == true) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  );
                                },
                                barrierDismissible: false,
                              );
                              manager.isLoginFormSubmit$
                                  .listen((event) {})
                                  .onDone(() {
                                Navigator.of(context).pop();
                                if (Overseer.statusCode == '200') {
                                  Get.offAll(MainScreen());
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
                                  colorText: Overseer.whiteColors,
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
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
