import 'package:corporator_admin/screens/UserScreens/AllUser/userDataTableManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';
import '../../../AppLayers/Streaming/Observer.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../Widgets/sow_entry_and_search_widgets.dart';
import '../UpdateUserScreen/EditUserProfileScreen/update_profile_screen.dart';
import '../UserOverviewScreen/view_user_screen.dart';
import 'user_data_table_model.dart';

class UserDataTable extends StatefulWidget {
   const UserDataTable({
    Key? key,
  }) : super(key: key);
  @override
  State<UserDataTable> createState() => _UserDataTableState();
}
class _UserDataTableState extends State<UserDataTable> {
  @override
  Widget build(BuildContext context) {
    UserDataTableManager userDataTableManager =
    Provider.of(context).fetch(UserDataTableManager);
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Overseer.whiteColors,
        borderRadius:  BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Observer<List<UserModel>>(
        stream: userDataTableManager.mainList,
        onSuccess: (context,snapshot){
          List<UserModel>? data =snapshot;
          UserModel modelData =data![0];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
             ShowEntryAndSearch(number: "${modelData.data!.length}"),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: DataTable(
                      horizontalMargin: 0,
                      columnSpacing:MediaQuery.of(context).size.width*.08,
                      columns:  [
                        DataColumn(
                          label: Row(
                            children: [
                              SizedBox(width: 15.w,),
                              Text("ID",
                                style: TextStyle(
                                    color: Overseer.grayColors,
                                    fontSize: 22.sp
                                ),
                              ),
                              Icon(Icons.arrow_drop_down,size: 22.sp,color: Overseer.grayColors,),
                            ],
                          ),
                        ),
                        DataColumn(
                          label: Row(
                            children: [
                              Text("Name",
                              style: TextStyle(
                                color: Overseer.grayColors,
                                fontSize: 22.sp
                              ),
                              ),
                              Icon(Icons.arrow_drop_down,size: 22.sp, color: Overseer.grayColors,),
                            ],
                          ),
                        ),
                        DataColumn(
                          label: Row(
                            children: [
                              Text("Email",
                              style: TextStyle(
                                color: Overseer.grayColors,
                                fontSize: 22.sp
                              ),
                              ),
                              Icon(Icons.arrow_drop_down,size: 22.sp, color: Overseer.grayColors,),
                            ],
                          ),
                        ),
                        DataColumn(
                          label: Row(
                            children: [
                              Text("Created Date",
                              style: TextStyle(
                                color: Overseer.grayColors,
                                fontSize: 22.sp
                              ),
                              ),
                              Icon(Icons.arrow_drop_down,size: 22.sp, color: Overseer.grayColors,),
                            ],
                          ),
                        ),
                        DataColumn(
                          label: Text("View",
                            style: TextStyle(
                                color: Overseer.grayColors,
                                fontSize: 22.sp
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text("Action",
                            style: TextStyle(
                              color: Overseer.grayColors,
                              fontSize: 22.sp
                          ),
                          ),
                        ),
                      ],
                      rows: List.generate(
                        modelData.data!.length,
                        (index) {
                          return DataRow(
                            cells: [
                              DataCell(
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                                  child: Text(modelData.data![index].id.toString(),
                                    style: TextStyle(
                                      color: Overseer.textColors,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(modelData.data![index].name.toString(),
                                  style: TextStyle(
                                    color: Overseer.textColors,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(modelData.data![index].email.toString(),
                                  style: TextStyle(
                                    color: Overseer.textColors,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(modelData.data![index].createdAt.substring(0,10).toString(),
                                  style: TextStyle(
                                    color: Overseer.textColors,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              DataCell(
                                  InkWell(
                                    onTap:(){
                                      Overseer.userId = modelData.data![index].id.toString();
                                      Get.to( ViewUserScreen(
                                        id: modelData.data![index].id,
                                        name: modelData.data![index].name.toString(),
                                        email: modelData.data![index].email.toString(),
                                        address: modelData.data![index].userinfo != null? modelData.data![index].userinfo!.address.toString():'',
                                        phoneNo:modelData.data![index].userinfo != null? modelData.data![index].userinfo!.phoneNo.toString():"",
                                        zipcode:modelData.data![index].userinfo != null? modelData.data![index].userinfo!.zipCode.toString():"",
                                        purpose:modelData.data![index].userinfo != null? modelData.data![index].userinfo!.purpose.toString():"",
                                        image:modelData.data![index].userinfo != null? modelData.data![index].userinfo!.picture.toString():"assets/images/Logo_Png_Orange.png",
                                        joiningDate: modelData.data![index].createdAt.substring(0,10),
                                      ),

                                      );
                                    },
                                    child: Text("View",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                              ),
                               DataCell(
                                   InkWell(
                                     onTap:(){
                                        Overseer.updateUserId= modelData.data![index].id.toString();
                                       Get.to( UpdateUserProfileScreen(
                                         id: modelData.data![index].id.toString(),
                                         name: modelData.data![index].name.toString(),
                                         email: modelData.data![index].email.toString(),
                                         address:modelData.data![index].userinfo != null? modelData.data![index].userinfo!.address.toString():"",
                                         phoneNo:modelData.data![index].userinfo != null? modelData.data![index].userinfo!.phoneNo.toString():"",
                                         zipCode:modelData.data![index].userinfo != null? modelData.data![index].userinfo!.zipCode.toString():"",
                                         purpose:modelData.data![index].userinfo != null? modelData.data![index].userinfo!.purpose.toString():"",
                                       ),
                                       );
                                     },
                                     child: Text("Edit",
                                       style: TextStyle(
                                         color: Colors.blue,
                                         fontSize: 20.sp,
                                         fontWeight: FontWeight.w500,
                                       ),
                                     ),
                                   )
                              ),
                            ],
                          );
                        }
                      ),
                    ),
                  ),
                ],
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
