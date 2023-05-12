import 'package:corporator_admin/screens/UserScreens/AllUser/userDataTableManager.dart';
import 'package:corporator_admin/screens/UserScreens/AllUser/user_data_table_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Observer.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../Widgets/sow_entry_and_search_widgets.dart';
import '../../../constants.dart';
import '../../RoleScreens/Widgets/dashboard_big_text_widgets.dart';
import '../UpdateUserScreen/EditUserProfileScreen/update_profile_screen.dart';
import '../UserOverviewScreen/view_user_screen.dart';

class UserMainScreen extends StatefulWidget {
  const UserMainScreen({Key? key}) : super(key: key);

  @override
  State<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  int? id;
  String? name;
  String? email;
  String? address;
  String? phoneNo;
  String? zipcode;
  String? purpose;
  String? image;
  String? joiningDate;
  refresh() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    UserDataTableManager userDataTableManager =
        Provider.of(context).fetch(UserDataTableManager);
    if(Overseer.viewVisi==false &&Overseer.editVisi==true){
      return EditUserProfileScreen(
        id: id,
        name: name,
        email: email,
        address: address,
        phoneNo: phoneNo,
        zipCode: zipcode,
        purpose: purpose,
        image: image,
       // joiningDate: joiningDate,
        notifyParent: refresh,
      );}
    else if(Overseer.viewVisi==true &&Overseer.editVisi==false){
      return ViewUserScreen(id: id,
        name: name,
        email: email,
        address: address,
        phoneNo: phoneNo,
        zipcode: zipcode,
        purpose: purpose,
        image: image,
        joiningDate: joiningDate,
        notifyParent: refresh,
      );}
    else if(Overseer.viewVisi==false &&Overseer.editVisi==false){
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DashboardBigTextWidgets(
            title: 'Users',
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            height: 860.h,
            decoration: BoxDecoration(
              color: Overseer.whiteColors,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 30.w, right: 20.w, top: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("All Users",
                      style: TextStyle(
                          color: Overseer.textColors,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                      ),
                  ),
                  SizedBox(height: 16.h),
                  Observer<List<UserModel>>(
                    stream: userDataTableManager.mainList,
                    onSuccess: (context, snapshot) {
                      List<UserModel>? data = snapshot;
                      UserModel modelData = data![0];
                      return Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                          ShowEntryAndSearch(number: "${modelData.data!.length}"),
                          SizedBox(height: 10.h),
                          SizedBox(
                            height: 705.h,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: [
                                DataTable(
                                  horizontalMargin: 0,
                                  columnSpacing:
                                  MediaQuery.of(context).size.width * .08,
                                  columns: [
                                    DataColumn(
                                      label: Row(
                                        children: [
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Text(
                                            "ID",
                                            style: TextStyle(
                                                color: Overseer
                                                    .grayColors,
                                                fontSize: 22.sp,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            size: 22.sp,
                                            color: Overseer.grayColors,
                                          ),
                                        ],
                                      ),
                                    ),
                                    DataColumn(
                                      label: Row(
                                        children: [
                                          Text(
                                            "Name",
                                            style: TextStyle(
                                                color: Overseer.grayColors,
                                                fontSize: 22.sp,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            size: 22.sp,
                                            color: Overseer.grayColors,
                                          ),
                                        ],
                                      ),
                                    ),
                                    DataColumn(
                                      label: Row(
                                        children: [
                                          Text(
                                            "Email",
                                            style: TextStyle(
                                                color: Overseer.grayColors,
                                                fontSize: 22.sp,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            size: 22.sp,
                                            color: Overseer.grayColors,
                                          ),
                                        ],
                                      ),
                                    ),
                                    DataColumn(
                                      label: Row(
                                        children: [
                                          Text(
                                            "Created Date",
                                            style: TextStyle(
                                                color: Overseer.grayColors,
                                                fontSize: 22.sp,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            size: 22.sp,
                                            color: Overseer.grayColors,
                                          ),
                                        ],
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        "View",
                                        style: TextStyle(
                                            color: Overseer.grayColors,
                                            fontSize: 22.sp,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        "Action",
                                        style: TextStyle(
                                            color: Overseer.grayColors,
                                            fontSize: 22.sp,
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
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal:
                                                    defaultPadding),
                                                child: Text(
                                                  modelData.data![index].id.toString(),
                                                  style: TextStyle(
                                                    color: Overseer.textColors,
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                modelData.data![index].name.toString(),
                                                style: TextStyle(
                                                  color: Overseer.textColors,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                modelData.data![index].email.toString(),
                                                style: TextStyle(
                                                  color: Overseer.textColors,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                modelData.data![index].createdAt.substring(0,10).toString(),
                                                style: TextStyle(
                                                  color: Overseer.textColors,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            DataCell(InkWell(
                                              onTap: () {
                                                Overseer.spacUsDowActId = modelData.data![index].id.toString();
                                                id = modelData.data![index].id;
                                                name = modelData.data![index].name.toString();
                                                email = modelData.data![index].email.toString();
                                                address = modelData.data![index].userinfo != null
                                                    ? modelData.data![index].userinfo!.address.toString()
                                                    : ' address';
                                                phoneNo = modelData.data![index].userinfo != null
                                                    ? modelData.data![index].userinfo!.phoneNo.toString()
                                                    : " phoneNo";
                                                zipcode = modelData.data![index].userinfo != null
                                                    ? modelData.data![index].userinfo!.zipCode.toString()
                                                    : " zip Code";
                                                purpose = modelData.data![index].userinfo != null
                                                    ? modelData.data![index].userinfo!.purpose.toString()
                                                    : " purpose";
                                                image = modelData.data![index].userinfo != null
                                                    ? modelData.data![index].userinfo!.picture.toString()
                                                    : "assets/images/admin_logo.png";
                                                joiningDate = modelData.data![index].createdAt.substring(0, 10);
                                                setState(() {
                                                  Overseer.viewVisi = true;
                                                  Overseer.editVisi = false;
                                                });
                                              },
                                              child: Text(
                                                "View",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 20.sp,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            ),
                                            DataCell(
                                                InkWell(
                                                  onTap: () {
                                                    Overseer.userId = modelData.data![index].id.toString();
                                                    id = modelData.data![index].id;
                                                    name = modelData.data![index].name.toString();
                                                    email = modelData.data![index].email.toString();
                                                    address = modelData.data![index].userinfo != null
                                                        ? modelData.data![index].userinfo!.address.toString()
                                                        : '';
                                                    phoneNo = modelData.data![index].userinfo != null
                                                        ? modelData.data![index].userinfo!.phoneNo.toString()
                                                        : "";
                                                    zipcode = modelData.data![index].userinfo != null
                                                        ? modelData.data![index].userinfo!.zipCode.toString()
                                                        : "";
                                                    purpose = modelData.data![index].userinfo != null
                                                        ? modelData.data![index].userinfo!.purpose.toString()
                                                        : "";
                                                    image = modelData.data![index].userinfo != null
                                                        ? modelData.data![index].userinfo!.picture.toString()
                                                        : "assets/images/admin_logo.png";
                                                    joiningDate = modelData.data![index].createdAt.substring(0, 10);
                                                    setState(() {
                                                      Overseer.viewVisi = false;
                                                      Overseer.editVisi = true;
                                                    });
                                                  },
                                                  child: Text(
                                                    "Edit",
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 20.sp,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    onWaiting: (context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    onError: (context, error) {
                      return const Text("Check Your Internet");
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      );}
    else{
      return Container(
        color:Colors.red,
        child: Text("nothing"),);
    }
  }
}
