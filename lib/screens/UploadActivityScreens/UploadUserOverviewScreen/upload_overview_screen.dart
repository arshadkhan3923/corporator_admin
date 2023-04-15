import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../Widgets/alertDialog_row_widgets.dart';

class UploadOverviewScreen extends StatelessWidget {
  String id;
  String? name;
  String? count;
  String? activity;
  String? createDate;
   UploadOverviewScreen({
    Key? key,
    required this.id,
    this.name,
    this.count,
    this.activity,
    this.createDate,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 30.w, top: 25.h),
            margin: EdgeInsets.all(30.h),
            decoration: BoxDecoration(
              color: Overseer.whiteColors,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail',
                  style: TextStyle(
                    color: Overseer.bgColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image.asset(
                    //   'assets/images/details_pic.png',
                    //   height: 290.h,
                    //   width: 194.w,
                    // ),
                    // SizedBox(
                    //   width: 20.w,
                    // ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 25.h,),
                        SizedBox(
                          height: 20.h,
                        ),
                        const AlertDialogOneWidget(
                          title: 'Name',
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        const AlertDialogOneWidget(
                          title: 'Count',
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        const AlertDialogOneWidget(
                          title: 'Activity ',
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        const AlertDialogOneWidget(
                          title: 'Create Date',
                        ),

                      ],
                    ),
                    SizedBox(
                      width: 150.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AlertDialogTwoWidget(
                          title: "widget.name!",
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        AlertDialogTwoWidget(
                          title: count!,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        AlertDialogTwoWidget(
                          title: activity!,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        AlertDialogTwoWidget(
                          title: createDate!.substring(0,10),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40.h,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}