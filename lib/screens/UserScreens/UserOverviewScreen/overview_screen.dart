import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import 'overview_screen_text.dart';

class OverviewScreen extends StatefulWidget {
  int id;
  String? name;
  String? email;
  String? joiningDate;
   OverviewScreen({Key? key,
     required this.id,
     this.name,
     this.email,
     this.joiningDate,
  }) : super(key: key);

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}
class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context){
    return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 327.h,
              // width: 1157.w,
              padding: EdgeInsets.only(left: 30.w, top: 25.h),
              margin: EdgeInsets.all(30.h),

              decoration: BoxDecoration(
                color: Overseer.whiteColors,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Info',
                    style: TextStyle(
                      color: Overseer.bgColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),),
                  SizedBox(height: 15.h,),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OverviewTextWidget(title: "Name"),
                          SizedBox(height: 16.h,),
                          OverviewTextWidget(title: "Email"),
                          SizedBox(height: 16.h,),
                          OverviewTextWidget(title: "Joining Date"),
                        ],
                      ),
                      SizedBox(width: 250.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OverviewTextWidget(title: widget.name!),
                          SizedBox(height: 16.h,),
                          OverviewTextWidget(title: widget.email!),
                          SizedBox(height: 16.h,),
                          OverviewTextWidget(title: widget.joiningDate!.substring(0,10)),
                        ],
                      ),
                      const Spacer(),
                    ],
                  )
                ],
              ),
            ),
          ],
        );
  }
}
