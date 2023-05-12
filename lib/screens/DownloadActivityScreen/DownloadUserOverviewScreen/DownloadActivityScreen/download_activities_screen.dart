import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../AppLayers/Streaming/Observer.dart';
import '../../../../AppLayers/Streaming/Overseer.dart';
import '../../../../AppLayers/Streaming/Provider.dart';
import '../../../UserScreens/UserOverviewScreen/SpecificActivitiesScreen/specific_user_manager.dart';
import '../../../UserScreens/UserOverviewScreen/SpecificActivitiesScreen/specific_user_model.dart';

class DownloadActivitiesScreen extends StatelessWidget {
  const DownloadActivitiesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SpecificUserManager specificUserManager =
    Provider.of(context).fetch(SpecificUserManager);
    return Padding(
      padding:  EdgeInsets.only(left: 30.w,top: 30.h),
      child:Observer<List<SpecificUserModel>>(
        stream: specificUserManager.mainList,
        onSuccess: (context,snapshot){
          List<SpecificUserModel>? data =snapshot;
          SpecificUserModel modelData =data![0];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Activities',
                style: TextStyle(
                  color: Overseer.bgColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.sp,),
              Container(
                margin: EdgeInsets.only(right: 20.w),
                decoration: BoxDecoration(
                  color: Overseer.whiteColors,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 680.h,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: modelData.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return  ListTile(
                              leading: CircleAvatar(
                                  backgroundColor: modelData.data[index].activity=="login"
                                      ? Overseer.primaryColor
                                      :modelData.data[index].activity=="upload"
                                      ?Colors.orangeAccent
                                      :modelData.data[index].activity=="download"
                                      ? Colors.blue
                                      :modelData.data[index].activity=="delete"
                                      ? Colors.red
                                      :modelData.data[index].activity=="logOut"
                                      ?Colors.red
                                      :modelData.data[index].activity=="register"
                                      ?Colors.blue
                                      :modelData.data[index].activity=="store"
                                      ? Colors.green
                                      :null,
                                  radius: 50.r,
                                  child:modelData.data[index].activity=="login"
                                      ? const Icon(Icons.login)
                                      :modelData.data[index].activity=="upload"
                                      ?const Icon(Icons.upload)
                                      :modelData.data[index].activity=="download"
                                      ? const Icon(Icons.download)
                                      :modelData.data[index].activity=="delete"
                                      ? const Icon(Icons.delete)
                                      :modelData.data[index].activity=="logOut"
                                      ?const Icon(Icons.logout_outlined)
                                      :modelData.data[index].activity=="register"
                                      ?const Icon(Icons.app_registration_outlined)
                                      :modelData.data[index].activity=="store"
                                      ? const Icon(Icons.store)
                                      :null
                              ),
                              title: Text(modelData.data[index].activity,
                                  style:  TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Overseer.grayColors,
                                  )
                              ),
                              subtitle: Text(modelData.data[index].createdAt.substring(0,10),
                                style:  TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Overseer.grayColors,
                                ),
                              ),
                            );
                          },),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
      ),
    );
  }
}