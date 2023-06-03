import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../MemoryQuotaScreen/MemoryQuotaOverviewScreen/memoey_quota_overview_screen_text.dart';

class OverviewWorkSpaceScreen extends StatefulWidget {
  String name;
  String totalStorage;
  String leftStorage;
  String updateDate;
  String zipCode;
  String address;
  String phoneNumber;

  OverviewWorkSpaceScreen(
      {Key? key,
      required this.name,
      required this.leftStorage,
      required this.totalStorage,
      required this.updateDate,
      required this.address,
      required this.phoneNumber,
      required this.zipCode})
      : super(key: key);

  @override
  State<OverviewWorkSpaceScreen> createState() =>
      _OverviewDownloadScreenState();
}

class _OverviewDownloadScreenState extends State<OverviewWorkSpaceScreen> {
  final _formKey = GlobalKey<FormState>();
  get index => 0;
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
                  'Info',
                  style: TextStyle(
                    color: Overseer.bgColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OverviewTextWidget(title: "Name"),
                        SizedBox(
                          height: 16.h,
                        ),
                        OverviewTextWidget(title: "Total Storage"),
                        SizedBox(
                          height: 16.h,
                        ),
                        OverviewTextWidget(title: "Storage Left"),
                        SizedBox(
                          height: 16.h,
                        ),
                        OverviewTextWidget(title: "Updated Date"),
                        SizedBox(
                          height: 16.h,
                        ),
                        OverviewTextWidget(title: "Phone Number"),
                        SizedBox(
                          height: 16.h,
                        ),
                        OverviewTextWidget(title: "ZIP Code"),
                        SizedBox(
                          height: 16.h,
                        ),
                        OverviewTextWidget(title: "Address"),
                      ],
                    ),
                    SizedBox(
                      width: 250.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OverviewTextWidget(title: widget.name.toString()),
                        SizedBox(
                          height: 16.h,
                        ),
                        OverviewTextWidget(
                            title: widget.totalStorage.toString()),
                        SizedBox(
                          height: 16.h,
                        ),
                        OverviewTextWidget(
                            title: widget.leftStorage.toString()),
                        SizedBox(
                          height: 16.h,
                        ),
                        OverviewTextWidget(title: widget.updateDate.toString()),
                        SizedBox(
                          height: 16.h,
                        ),
                        OverviewTextWidget(
                            title: widget.phoneNumber.toString()),
                        SizedBox(
                          height: 16.h,
                        ),
                        OverviewTextWidget(title: widget.zipCode.toString()),
                        SizedBox(
                          height: 16.h,
                        ),
                        OverviewTextWidget(title: widget.address.toString()),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
