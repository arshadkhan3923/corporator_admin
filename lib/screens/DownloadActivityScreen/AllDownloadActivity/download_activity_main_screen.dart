import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../responsive.dart';
import '../../RoleScreens/Widgets/dashboard_big_text_widgets.dart';
import '../../RoleScreens/Widgets/header.dart';
import 'download_data_table_screen.dart';

class DownloadActivityMainScreen  extends StatelessWidget {
  const DownloadActivityMainScreen ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardBigTextWidgets(title: 'Download Activity',),

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
                            "Downloads",
                            style: TextStyle(
                                color: Overseer.textColors,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500
                            )
                        ),
                        if(!Responsive.isMobile(context))
                          SizedBox(
                              height: Get.height*.050,
                              width: Get.width*.2,
                              child: SearchField()
                          ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    const DownloadDataTable(),
                    // SizedBox(height: 30.h),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //    DashboardTextWidgets(title: 'Next'),
                    //     SizedBox(width: 15.w,),
                    //     Container(
                    //       height: 21.h,
                    //       width: 21.w,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(5.r),
                    //         color: Overseer.bgColors,
                    //       ),
                    //       child: Center(child: Text('1',
                    //         style: TextStyle(
                    //           color: Overseer.whiteColors,
                    //           fontSize: 13.sp,
                    //
                    //         ),
                    //       )),
                    //     ),
                    //     SizedBox(width: 10.w,),
                    //     Container(
                    //       height: 21.h,
                    //       width: 21.w,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(5.r),
                    //         color: Overseer.whiteColors,
                    //           border: Border.all(
                    //             color: Overseer.bgColors,//<---- Insert Gradient Here
                    //             width: 1,
                    //           )
                    //       ),
                    //       child: Center(child: Text('2',
                    //       style: TextStyle(
                    //         color: Overseer.bgColors,
                    //         fontSize: 13.sp,
                    //
                    //       ),
                    //       )
                    //       ),
                    //     ),
                    //     SizedBox(width: 15.w,),
                    //     DashboardTextWidgets(title: 'Previous'),
                    //
                    //   ],
                    // ),
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

