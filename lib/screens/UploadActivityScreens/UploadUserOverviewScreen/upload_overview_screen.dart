import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../Widgets/alertDialog_row_widgets.dart';

class UploadOverviewScreen extends StatefulWidget {
  String? id;
  String? name;

  String? activity;
  String? createDate;
   UploadOverviewScreen({
    Key? key,
    required this.id,
    this.name,

    this.activity,
    this.createDate,
  }) : super(key: key);

  @override
  State<UploadOverviewScreen> createState() => _UploadOverviewScreenState();
}

class _UploadOverviewScreenState extends State<UploadOverviewScreen> {
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h,),
                        const AlertDialogOneWidget(
                          title: 'Name',
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
                    children: [
                      AlertDialogTwoWidget(
                        title: widget.name.toString(),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      AlertDialogTwoWidget(
                        title: widget.activity.toString(),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      AlertDialogTwoWidget(
                        title: widget.createDate.toString().substring(0,10),
                      ),
                    ],
                  )
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
