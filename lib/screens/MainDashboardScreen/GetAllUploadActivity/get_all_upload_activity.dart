import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../GetAllRevenueScreen/all_revenue_manager.dart';
import '../GetAllRevenueScreen/all_revenue_model.dart';

class AllUploadActivity extends StatelessWidget {
  const AllUploadActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AllRevenueManager allRevenueManager =
    Provider.of(context).fetch(AllRevenueManager);
    return Container(
      height: 100.h,
      width: 267.w,
      decoration: BoxDecoration(
        color: Overseer.whiteColors,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: 26.w,top: 18.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Upload Activity ",
              style: TextStyle(
                color: Overseer.bgColors,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h,),
            StreamBuilder<List<AllRevenueModel>>(
              stream: allRevenueManager.mainList,
              builder: (context, snapshot) {
                return Text(snapshot.data == null ?"0" :  snapshot.data![0].uploadActivity.toString(),
                  style: TextStyle(
                    color: Overseer.bgColors,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
