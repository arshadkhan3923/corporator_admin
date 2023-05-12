import 'package:corporator_admin/screens/UploadActivityScreens/AllUploadActivity/upload_user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Streaming/Observer.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../constants.dart';
import '../../../responsive.dart';
import '../../RoleScreens/Widgets/dashboard_big_text_widgets.dart';
import '../../RoleScreens/Widgets/header.dart';
import '../UploadUserOverviewScreen/view_upload_overview_screen.dart';
import 'all_upload_manager_screen.dart';

class UploadActivityMainScreen  extends StatefulWidget {
  const UploadActivityMainScreen ({Key? key}) : super(key: key);

  @override
  State<UploadActivityMainScreen> createState() => _UploadActivityMainScreenState();
}

class _UploadActivityMainScreenState extends State<UploadActivityMainScreen> {
  String? id;
  String? name;
  String? activity;
  String? createDate;
  String? image;
  refresh() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    AllUploadManager allUploadManager =
    Provider.of(context).fetch(AllUploadManager);
    return Overseer.viewVisi == false? Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardBigTextWidgets(title: 'Upload Activity',),
        SizedBox(height: 30.h,),
        Container(
          height: 860.h,
          decoration: BoxDecoration(
            color: Overseer.whiteColors,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding:  EdgeInsets.only(left: 30.w,right: 20.w,top: 25.h),
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

    Observer<List<UploadModel>>(
    stream: allUploadManager.mainList,
    onSuccess: (context,snapshot) {
    List<UploadModel>? data = snapshot;
    UploadModel modelData = data![0];
    return SingleChildScrollView(
      child: SizedBox(
        height: 720.h,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(
            width: double.infinity,
            child: DataTable(
            horizontalMargin: 0,
            columnSpacing: MediaQuery.of(context).size.width * .09,
            columns: [
            DataColumn(
            label: Row(
            children: [
            Text("Name",
            style: TextStyle(
            color: Overseer.grayColors,
            fontSize: 22.sp
            ),
            ),
            Icon(Icons.arrow_drop_down, size: 22.sp,
            color: Overseer.grayColors,),
            ],
            ),
            ),
            DataColumn(
            label: Row(
            children: [
            Text("Activity",
            style: TextStyle(
            color: Overseer.grayColors,
            fontSize: 22.sp
            ),
            ),
            Icon(Icons.arrow_drop_down, size: 22.sp,
            color: Overseer.grayColors,),
            ],
            ),
            ),
            DataColumn(
            label: Row(
            children: [
            Text("Upload Data",
            style: TextStyle(
            color: Overseer.grayColors,
            fontSize: 22.sp
            ),
            ),
            Icon(Icons.arrow_drop_down, size: 22.sp,
            color: Overseer.grayColors,),
            ],
            ),
            ),

            // DataColumn(
            // label: Text("View",
            // style: TextStyle(
            // color: Overseer.grayColors,
            // fontSize: 22.sp
            // ),
            // ),
            // ),
            ],
            rows: List.generate(
            modelData.data!.length,
            (index){
            return DataRow(
            cells: [
            DataCell(
            Row(
            children: [
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Row(
            children: [
            Text(
            modelData.data![index].userName.toString(),
            style: TextStyle(
            color: Overseer.textColors,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            ),
            ],
            ),
            ),
            ],
            ),
            ),
            DataCell(
            Text(modelData.data![index].activity.toString(),
            style: TextStyle(
            color: Overseer.textColors,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            ),
            ),
            ),
            DataCell(
            Text(modelData.data![index].createdAt!.substring(0,19),
            style: TextStyle(
            color: Overseer.textColors,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            ),
            ),
            ),
            // DataCell(
            // InkWell(
            // onTap: (){
            //   Overseer.spacUsDowActId = modelData.data![index].id.toString();
            //   print("uploade=====${Overseer.spacUsDowActId}");
            // id=modelData.data![index].id;
            // name=modelData.data![index].userName.toString();
            // activity=modelData.data![index].activity.toString();
            // createDate=modelData.data![index].createdAt!.substring(0,10);
            // setState(() {
            //   Overseer.viewvisi=true;
            // });
            // },
            // child: Text("View",
            // style: TextStyle(
            // color: Overseer.primaryColor,
            // fontSize: 20.sp,
            // fontWeight: FontWeight.w400,
            // ),
            // ),
            // ),
            // ),
            ],
            );
            },
            ),
            ),
            ),
            ],
            ),
          ],
        ),
      ),
    );
    },
    onWaiting: (context){
    return const Center(
    child: CircularProgressIndicator(),
    );
    },
    onError: (context,error){
    return const Text("Check Your Internet");
    },
    )
              ],
            ),
          ),
        ),
      ],
    ):
    SizedBox(
      height: 950.h,
      child: ViewUploadScreen(
        id:id,
        name:name,
        activity:activity,
        createDate:createDate,
        notifyParent: refresh,


      ),
    );
  }
}

