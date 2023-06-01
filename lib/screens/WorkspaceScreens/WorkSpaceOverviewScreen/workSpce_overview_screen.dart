import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../UserScreens/UserOverviewScreen/SpecificActivitiesScreen/activities_screen.dart';
import 'WorkSpaceSettingScreen/workSpace_setting_screen.dart';
import 'overview_workSpace_screen.dart';

// ignore: must_be_immutable
class ViewWorkSpaceScreen extends StatefulWidget {
  final Function() notifyParent;
  String? name;
  String? totalStorage;
  String? leftStorage;
  String? updateDate;
  String? profileImg;
  String? profileName;
  String? zipCode;
  String? address;
  String? phoneNumber;

  ViewWorkSpaceScreen(
      {Key? key,
        required this.notifyParent,
      required this.updateDate,
      required this.leftStorage,
      required this.totalStorage,
      required this.name,
      required this.profileImg,
      required this.profileName,
      required this.address,
      required this.zipCode,
      required this.phoneNumber})
      : super(key: key);
  @override
  State<ViewWorkSpaceScreen> createState() => _EditUserDownloadScreenState();
}

class _EditUserDownloadScreenState extends State<ViewWorkSpaceScreen> {
  get index => 0;
  int _isListVisible = 1;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Overseer.viewVsi = false;
                          Overseer.editVisi = false;
                          widget.notifyParent();
                        },
                        icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
                      ),
                      CircleAvatar(
                          radius: 40.r,
                          backgroundImage: NetworkImage(widget.profileImg.toString(),
                              ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        widget.profileName.toString(),
                        style: TextStyle(
                          color: Overseer.whiteColors,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
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
                            child: Text(
                              'Overview',
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
                      SizedBox(
                        width: 10.w,
                      ),
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
                            child: Text(
                              'Activities',
                              style: TextStyle(
                                color: _isListVisible == 2
                                    ? Overseer.bgColor
                                    : Overseer.whiteColors,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
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
                            child: Text(
                              'Setting',
                              style: TextStyle(
                                color: _isListVisible == 3
                                    ? Overseer.bgColor
                                    : Overseer.whiteColors,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _isListVisible == 1
                ? OverviewWorkSpaceScreen(
                    phoneNumber: widget.phoneNumber.toString(),
                    zipCode: widget.zipCode.toString(),
                    address: widget.address.toString(),
                    name: widget.name.toString(),
                    leftStorage: widget.leftStorage.toString(),
                    totalStorage: widget.totalStorage.toString(),
                    updateDate: widget.updateDate.toString(),
                  )
                : _isListVisible == 2
                    ? const SpecificActivitiesScreen()
                    : _isListVisible == 3
                        ? const WorkSpaceSettingScreen()
                        : Container(),
          ],
        ),
      ),
    );
  }
}
