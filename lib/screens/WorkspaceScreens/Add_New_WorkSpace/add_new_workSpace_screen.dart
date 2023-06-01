import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../Widgets/Button.dart';
import '../../../utils/app_colors.dart';
import '../../RoleScreens/Widgets/dashboard_big_text_widgets.dart';
import '../Corporate/carporater_manager.dart';
import '../Corporate/carporater_model.dart';
import 'add_new_workSpace_manager.dart';

class AddNewWorkSpaceScreen extends StatefulWidget {
  const AddNewWorkSpaceScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<AddNewWorkSpaceScreen> createState() => _AddNewWorkSpaceScreenState();
}

class _AddNewWorkSpaceScreenState extends State<AddNewWorkSpaceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _quoteController = TextEditingController();
  final _durationController = TextEditingController();
  final _ownerIDController = TextEditingController();
  String? _selectedCategories;
  @override
  Widget build(BuildContext context) {
    ///corporateManager
    CorporateManager carporateManager =
        Provider.of(context).fetch(CorporateManager);carporateManager.mainList;

    ///addWorkSpaceNewManager
    AddWorkSpaceNewManager addWorkSpaceNewManager =
        Provider.of(context).fetch(AddWorkSpaceNewManager);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DashboardBigTextWidgets(
            title: 'Create WorkSpace',
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            height: 855.h,
            decoration: BoxDecoration(
              color: Overseer.whiteColors,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 30.w, right: 20.w, top: 25.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Create New WorkSpace",
                      style: TextStyle(
                          color: Overseer.textColors,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                      ),
                  ),
                  SizedBox(height: 25.h),
                  SizedBox(
                    height: 760.h,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        ///
                        StreamBuilder<String>(
                            stream: addWorkSpaceNewManager.name$,
                            builder: (context, snapshot) {
                              return TextFormField(
                                style: const TextStyle(
                                  color: Overseer.blackColors,
                                ),
                                controller: _nameController,
                                autofocus: false,
                                onChanged: (value) {
                                  addWorkSpaceNewManager.inName.add(value);
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
                                  labelText: 'Name',
                                  fillColor: Overseer.whiteColors,
                                  errorText: snapshot.error == null
                                      ? ""
                                      : snapshot.error.toString(),
                                  errorStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              );
                            }),
                        ///
                        StreamBuilder<String>(
                            stream: addWorkSpaceNewManager.quota$,
                            builder: (context, snapshot) {
                              return TextFormField(
                                style: const TextStyle(
                                  color: Overseer.blackColors,
                                ),
                                controller: _quoteController,
                                autofocus: false,
                                onChanged: (value) {
                                  addWorkSpaceNewManager.inqQuota.add(value);
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
                                  labelText: 'Quota',
                                  fillColor: Overseer.whiteColors,
                                  errorText: snapshot.error == null
                                      ? ""
                                      : snapshot.error.toString(),
                                  errorStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              );
                            }),
                        ///
                        StreamBuilder<String>(
                            stream: addWorkSpaceNewManager.price$,
                            builder: (context, snapshot) {
                              return TextFormField(
                                style: const TextStyle(
                                  color: Overseer.blackColors,
                                ),
                                controller: _priceController,
                                autofocus: false,
                                onChanged: (value) {
                                  addWorkSpaceNewManager.inPrice.add(value);
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
                                  labelText: 'Price',
                                  fillColor: Overseer.whiteColors,
                                  errorText: snapshot.error == null
                                      ? ""
                                      : snapshot.error.toString(),
                                  errorStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              );
                            }),
                        ///
                        StreamBuilder<String>(
                            stream: addWorkSpaceNewManager.duration$,
                            builder: (context, snapshot) {
                              return TextFormField(
                                style: const TextStyle(
                                  color: Overseer.blackColors,
                                ),
                                controller: _durationController,
                                autofocus: false,
                                onChanged: (value) {
                                  addWorkSpaceNewManager.inDuration.add(value);
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
                                  labelText: 'Duration',
                                  fillColor: Overseer.whiteColors,
                                  errorText: snapshot.error == null
                                      ? ""
                                      : snapshot.error.toString(),
                                  errorStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              );
                            }),
                        ///
                        StreamBuilder<List<CorporateModel>>(
                            stream: carporateManager.mainList,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: AppColors.grayColors,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: DropdownButton(
                                      elevation: 2,
                                      isExpanded: true,
                                      underline: Container(),
                                      hint: const Text("Owner ID"),
                                      value: _selectedCategories,
                                      onChanged: (newValue) {
                                        //int nameIndex =
                                        setState(() {
                                          _selectedCategories = newValue!;
                                        });
                                        addWorkSpaceNewManager.inOwnerId
                                            .add(newValue!);
                                      },
                                      items: snapshot.data![0].data
                                          ?.map((Data location) {
                                        return DropdownMenuItem(
                                          value: location.id.toString(),
                                          child: Text(location.name.toString()),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                );
                              } else {
                                return Text("loading");
                              }
                            }),
                        /// button
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StreamBuilder<Object>(
                                stream: addWorkSpaceNewManager
                                    .isFormRegisterVendorValid$,
                                builder: (context, snapshot) {
                                  return Button(
                                    title: 'Create WorkSpace',
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
                                        addWorkSpaceNewManager
                                            .isFormRegisterVendorSubmit$
                                            .listen((event) {})
                                            .onDone(() {
                                          Navigator.of(context).pop();
                                          if (Overseer.statusCode == '200') {}
                                        });
                                      } else {
                                        if (snapshot.error == null) {
                                          Get.snackbar(
                                            "Error",
                                            "Fill the form Properly",
                                            dismissDirection:
                                                DismissDirection.horizontal,
                                            isDismissible: true,
                                            backgroundColor:
                                                Colors.orangeAccent,
                                            duration:
                                                const Duration(seconds: 3),
                                            icon: const Icon(
                                              Icons.error_outline,
                                              color: Colors.red,
                                            ),
                                          );
                                        } else {
                                          Get.snackbar(
                                            "Error",
                                            "${snapshot.error}",
                                            dismissDirection:
                                                DismissDirection.horizontal,
                                            isDismissible: true,
                                            backgroundColor:
                                                Colors.orangeAccent,
                                            duration:
                                                const Duration(seconds: 3),
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
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
