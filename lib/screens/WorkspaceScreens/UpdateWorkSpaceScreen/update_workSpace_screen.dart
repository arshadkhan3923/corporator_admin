import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../RoleScreens/Widgets/dashboard_text_widgets.dart';

class UpdateWorkSpaceInformation extends StatefulWidget {
  const UpdateWorkSpaceInformation({Key? key,}) : super(key: key);
  @override
  State<UpdateWorkSpaceInformation> createState() => _UpdateWorkSpaceInformationState();
}
class _UpdateWorkSpaceInformationState extends State<UpdateWorkSpaceInformation> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: InkWell(
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
                TextFormField(
                  // controller: nameController,
                  autofocus: false,
                  onChanged: (value){
                    // updatePackageManager.inName.add(value);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(color: Colors.black,width: 1.w),
                    ),
                    // errorText: snapshot.error == null
                    //     ? ""
                    //     : snapshot.error.toString(),
                    labelStyle:  TextStyle(
                        color: Colors.grey,fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                    fillColor: Overseer.whiteColors,
                    filled: true,
                    labelText: 'Package Name',
                  ),
                ),
                SizedBox(height: 5.h,),
                TextFormField(
                  // controller: nameController,
                  autofocus: false,
                  onChanged: (value){
                    // updatePackageManager.inName.add(value);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(color: Colors.black,width: 1.w),
                    ),
                    // errorText: snapshot.error == null
                    //     ? ""
                    //     : snapshot.error.toString(),
                    labelStyle:  TextStyle(
                        color: Colors.grey,fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                    fillColor: Overseer.whiteColors,
                    filled: true,
                    labelText: 'Package Name',
                  ),
                ),
                SizedBox(height: 10.h,),
                TextFormField(
                  // controller: nameController,
                  autofocus: false,
                  onChanged: (value){
                    // updatePackageManager.inName.add(value);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(color: Colors.black,width: 1.w),
                    ),
                    // errorText: snapshot.error == null
                    //     ? ""
                    //     : snapshot.error.toString(),
                    labelStyle:  TextStyle(
                        color: Colors.grey,fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                    fillColor: Overseer.whiteColors,
                    filled: true,
                    labelText: 'Package Name',
                  ),
                ),
                SizedBox(height: 10.h,),
                TextFormField(
                  // controller: nameController,
                  autofocus: false,
                  onChanged: (value){
                    // updatePackageManager.inName.add(value);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(color: Colors.black,width: 1.w),
                    ),
                    // errorText: snapshot.error == null
                    //     ? ""
                    //     : snapshot.error.toString(),
                    labelStyle:  TextStyle(
                        color: Colors.grey,fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                    fillColor: Overseer.whiteColors,
                    filled: true,
                    labelText: 'Package Name',
                  ),
                ),
                SizedBox(height: 25.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 140.w,
                        height:50.h,
                        decoration: BoxDecoration(
                            color: Overseer.whiteColors,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: Overseer.bgColor)
                        ),
                        child: const Center(child: DashboardTextWidgets(title: 'Cancel',)),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Container(
                      height: 50.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                        color: Overseer.bgColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Text("Update",
                          style: TextStyle(
                            color: Overseer.grayColors,
                            fontSize: 18.sp,
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
        ),
      ),
    );
  }
}
