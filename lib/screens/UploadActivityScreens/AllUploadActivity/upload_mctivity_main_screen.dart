import 'package:corporator_admin/screens/UploadActivityScreens/AllUploadActivity/upload_Activity_data_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../responsive.dart';
import '../../RoleScreens/Widgets/dashboard_big_text_widgets.dart';
import '../../RoleScreens/Widgets/header.dart';

class UploadActivityMainScreen  extends StatelessWidget {
  const UploadActivityMainScreen ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardBigTextWidgets(title: 'Upload Activity',),
        SizedBox(height: 30.h,),
        Container(
          decoration: BoxDecoration(
            color: Overseer.whiteColors,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding:  EdgeInsets.only(left: 30.w,right: 20.w,top: 25.h),
            child: SingleChildScrollView(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "Uploads",
                            style: TextStyle(
                                color: Overseer.textColors,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500
                            )
                        ),
                        if(!Responsive.isMobile(context))
                          SizedBox(
                              height: Get.height*.050,
                              width: Get.width*.2,
                              child: const SearchField()
                          ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    const UploadDataTable(),
                    SizedBox(height: 30.h,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

