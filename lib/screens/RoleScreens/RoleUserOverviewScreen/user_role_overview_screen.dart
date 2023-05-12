import 'package:corporator_admin/screens/RoleScreens/RoleUserOverviewScreen/role_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../UserScreens/UserOverviewScreen/SpecificActivitiesScreen/activities_screen.dart';
import 'RoleSettingScreen/role_setting_screen.dart';


// ignore: must_be_immutable
class ViewUSerRoleScreen extends StatefulWidget {
  final Function() notifyParent;
  String? id;
  String? name;
  String? email;
  String? update;
  String? image;
   ViewUSerRoleScreen({Key? key,
      this.id,
     required this.notifyParent,
     this.name,
     this.email,
     this.update,
     this.image,
  }) : super(key: key);
  @override
  State<ViewUSerRoleScreen> createState() => _ViewUSerRoleScreenState();
}
class _ViewUSerRoleScreenState extends State<ViewUSerRoleScreen> {
  get index => 0;
  int _isListVisible = 1;
  @override
  Widget build(BuildContext context,){
    return   Column(
        children: [
          Container(
            padding: EdgeInsets.all(30.h),
            margin: EdgeInsets.all(30.h),
            decoration: BoxDecoration(
              color: Overseer.bgColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          print("********************************************************");
                          Overseer.viewVisi = false;
                          Overseer.editVisi = false;
                          widget.notifyParent();
                        },
                        icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                    CircleAvatar(
                      radius: 40.r,
                      backgroundImage: NetworkImage(
                       widget.image.toString(),
                      ),
                    ),
                    SizedBox(width: 15.w,),
                    Text(widget.name!,
                      style: TextStyle(
                        color: Overseer.whiteColors,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h,),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // Overseer.updateRoleId = widget.id;
                        setState(() {
                          _isListVisible = 1;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 113.w,
                        decoration: BoxDecoration(
                          color: _isListVisible == 1
                              ? Overseer.whiteColors
                              : Overseer.bgColor,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: _isListVisible == 1
                                ? Overseer.bgColor
                                : Overseer.whiteColors,
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: Text('Overview',
                            style: TextStyle(
                              color: _isListVisible == 1
                                  ? Overseer.bgColor
                                  : Overseer.whiteColors,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isListVisible = 2;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 113.w,
                        decoration: BoxDecoration(
                          color: _isListVisible == 2
                              ? Overseer.whiteColors
                              : Overseer.bgColor,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: _isListVisible == 2
                                ? Overseer.bgColor
                                : Overseer.whiteColors,
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: Text('Activities',
                            style: TextStyle(
                              color: _isListVisible == 2
                                  ? Overseer.bgColor
                                  : Overseer.whiteColors,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isListVisible = 3;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 113.w,
                        decoration: BoxDecoration(
                          color: _isListVisible == 3
                              ? Overseer.whiteColors
                              : Overseer.bgColor,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: _isListVisible == 3
                                ? Overseer.bgColor
                                : Overseer.whiteColors,
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: Text('Setting',
                            style: TextStyle(
                              color: _isListVisible == 3
                                  ? Overseer.bgColor
                                  : Overseer.whiteColors,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w,),
                  ],
                ),
              ],
            ),
          ),
          _isListVisible == 1 ? OverviewRoleScreen(
            id: widget.id.toString(),
            name: widget.name,
            email: widget.email,
            update: widget.update,
          ) :
          _isListVisible == 2 ? const SpecificActivitiesScreen() :
          _isListVisible == 3 ? const RoleSettingScreen() : Container(),
        ],
      );

  }
}
