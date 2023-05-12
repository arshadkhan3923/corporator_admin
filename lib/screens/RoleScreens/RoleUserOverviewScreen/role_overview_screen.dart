import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import 'role_overview_screen_text.dart';

class OverviewRoleScreen extends StatelessWidget {
  String? id;
  String? name;
  String? email;
  String? update;
   OverviewRoleScreen({Key? key,
      this.id,
     this.name,
     this.email,
     this.update,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
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
                        OverviewTextWidget(title: "Updated Date"),
                      ],
                    ),
                    SizedBox(width: 250.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OverviewTextWidget(title: name!),
                        SizedBox(height: 16.h,),
                        OverviewTextWidget(title:email!),
                        SizedBox(height: 16.h,),
                        OverviewTextWidget(title: update!.substring(0,10)),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: 15.h,),
              ],
            ),
          ),
        ],
      );
  }
}
