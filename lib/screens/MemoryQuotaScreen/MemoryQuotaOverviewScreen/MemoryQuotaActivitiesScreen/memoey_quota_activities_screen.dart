import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../AppLayers/Streaming/Overseer.dart';

class MemoryQuotaActivitiesScreen extends StatefulWidget {
  const MemoryQuotaActivitiesScreen({Key? key}) : super(key: key);

  @override
  State<MemoryQuotaActivitiesScreen> createState() => _DownloadActivitiesScreenState();
}

class _DownloadActivitiesScreenState extends State<MemoryQuotaActivitiesScreen> {
  List<StepperData> stepperData = [
    StepperData(
        title: StepperText(
          "8:00 AM",
          textStyle:  TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Overseer.grayColors,
          ),
        ),
        subtitle: StepperText("Downloaded a PNG file."),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Color(0xff6B80FD),
              shape: BoxShape.circle,
          ),
          child: Image.asset("assets/images/download.png",height: 30.h,width: 30.w,),
        ),
    ),
    StepperData(
      title: StepperText(
        "07:20 AM",
        textStyle:  TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Overseer.grayColors,
        ),
      ),
      subtitle: StepperText("Uploaded a Video."),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Color(0xff40D33D),
          shape: BoxShape.circle,
        ),
        child: Image.asset("assets/images/upload.png",height: 30.h,width: 30.w,),
      ),
    ),
    StepperData(
      title: StepperText(
        "10:00 AM",
        textStyle:  TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Overseer.grayColors,
        ),
      ),
      subtitle: StepperText("Upgraded Account from Basic to Premium."),
      iconWidget: Container(

        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xffC9D775),
          shape: BoxShape.circle,
        ),
        child: Image.asset("assets/images/Sortuplight.png",height: 30.h,width: 30.w,),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.only(left: 30.w,top: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Activities',
            style: TextStyle(
              color: Overseer.bgColor,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),),
          Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: AnotherStepper(
              stepperList: stepperData,
              stepperDirection: Axis.vertical,
              iconWidth: 55.w,
              iconHeight: 55.h,
              activeBarColor: Colors.green,
              inActiveBarColor: Colors.grey,
              inverted: false,
              verticalGap: 40.h,
              activeIndex: 1,
              barThickness: 4,
            ),
          ),
        ],
      ),
    );
  }
}
