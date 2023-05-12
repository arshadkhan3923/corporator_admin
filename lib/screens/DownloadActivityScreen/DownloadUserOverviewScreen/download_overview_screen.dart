import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../Widgets/alertDialog_row_widgets.dart';

// ignore: must_be_immutable
class OverviewDownloadScreen extends StatefulWidget {
  String? name;
  String? activity;
  String? createDate;

  OverviewDownloadScreen({
    Key? key,
    this.name,
    this.activity,
    this.createDate,
  }) : super(key: key);
  @override
  State<OverviewDownloadScreen> createState() => _OverviewDownloadScreenState();
}
class _OverviewDownloadScreenState extends State<OverviewDownloadScreen> {
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
                        SizedBox(height: 25.h,),
                        const AlertDialogTwoWidget(
                          title: 'Name',
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        const AlertDialogTwoWidget(
                          title: 'Activity ',
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        const AlertDialogTwoWidget(
                          title: 'Upload Date',
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 150.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                         AlertDialogOneWidget(
                          title: widget.name!,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                         AlertDialogOneWidget(
                          title: widget.activity!,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                         AlertDialogOneWidget(
                          title: widget.createDate!.substring(0,10),
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
