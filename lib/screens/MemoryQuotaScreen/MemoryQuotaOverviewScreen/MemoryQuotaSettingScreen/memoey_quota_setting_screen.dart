import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../AppLayers/Streaming/Overseer.dart';
import '../../../RoleScreens/Widgets/dashboard_text_widgets.dart';
import '../../../SettingsScreens/Components/switch_button_widget.dart';
class MemoryQuotaSettingScreen extends StatefulWidget {
  const MemoryQuotaSettingScreen({Key? key}) : super(key: key);

  @override
  State<MemoryQuotaSettingScreen> createState() => _DownloadSettingScreenState();
}

class _DownloadSettingScreenState extends State<MemoryQuotaSettingScreen> {
  bool _switchVal = true;
  bool _switchVal1 = false;
  bool _switchVal2 = false;
  bool _switchVal3 = true;
  bool _switchVal4 = true;
  bool _switchVal5 = false;
  bool _switchVal6 = true;
  bool _switchVal7 = true;
  bool _switchVal8 = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Overseer.whiteColors
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: 30.w, right: 30.w, top: 30.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Setting
              Text('Settings',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: Overseer.textColors
                ),
              ),
              SizedBox(height: 8.h,),
              Row(
                children: [
                  const DashboardTextWidgets(
                      title: 'Enable/ Disable Account'),
                  SizedBox(width: 335.w,),
                  SwitchButton(
                    onChange1: (bool value) {
                      setState(() => _switchVal = value);
                    },
                    value1: _switchVal,
                    title: 'Enabled',
                  ),
                ],
              ),
              SizedBox(height: 25.h,),
              Divider(height: 1.h, color: Overseer.grayColors,),
              SizedBox(height: 25.h,),
///Upgrade Package
             Row(
               children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text('Upgrade Package',
                       style: TextStyle(
                           fontWeight: FontWeight.w500,
                           fontSize: 20.sp,
                           color: Overseer.textColors
                       ),
                     ),
                     SizedBox(height: 8.h,),
                     Text('Disable This if you not want user to\nUpgrade their Account.',
                       style: TextStyle(
                           fontWeight: FontWeight.w500,
                           fontSize: 16.sp,
                           color: Overseer.grayColors
                       ),
                     ),
                   ],
                 ),
                 SizedBox(width: 300.w,),
                 SwitchButton(
                   onChange1: (bool value) {
                     setState(() => _switchVal1 = value);
                   },
                   value1: _switchVal1,
                   title: 'Enabled',
                 ),
               ],
             ),
              SizedBox(height: 25.h,),
              Divider(height: 1.h, color: Overseer.grayColors,),
              SizedBox(height: 25.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email Notifications ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: Overseer.textColors
                        ),
                      ),
                      SizedBox(height: 8.h,),
                      const DashboardTextWidgets(
                          title: 'These are the notifications that can be\nsend you at your email.'),
                    ],
                  ),
                  SizedBox(width: 260.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SwitchButton(
                            onChange1: (bool value) {
                              setState(() => _switchVal2 = value);
                            },
                            value1: _switchVal2,
                            title: 'Advertise',
                          ),
                        ],
                      ),
                      Row(
                        children: [

                          SwitchButton(
                            onChange1: (bool value) {
                              setState(() => _switchVal3 = value);
                            },
                            value1: _switchVal3,
                            title: 'Promotions',
                          ),
                        ],
                      ),
                      Row(
                        children: [

                          SwitchButton(
                            onChange1: (bool value) {
                              setState(() => _switchVal4 = value);
                            },
                            value1: _switchVal4,
                            title: 'Comments',
                          ),
                        ],
                      ),
                      Row(
                        children: [

                          SwitchButton(
                            onChange1: (bool value) {
                              setState(() => _switchVal5 = value);
                            },
                            value1: _switchVal5,
                            title: 'Reminders',
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h,),
                    ],
                  )
                ],
              ),
              Divider(height: 1.h, color: Overseer.grayColors,),
              SizedBox(height: 25.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Push Notifications ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: Overseer.textColors
                        ),
                      ),
                      SizedBox(height: 8.h,),
                      const DashboardTextWidgets(
                          title: 'These are the notifications that can be\nsend you at your email.'),
                    ],
                  ),
                  SizedBox(width: 260.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SwitchButton(
                            onChange1: (bool value) {
                              setState(() => _switchVal6 = value);
                            },
                            value1: _switchVal6,
                            title: 'Advertise',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SwitchButton(
                            onChange1: (bool value) {
                              setState(() => _switchVal7 = value);
                            },
                            value1: _switchVal7,
                            title: 'Promotions',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SwitchButton(
                            onChange1: (bool value) {
                              setState(() => _switchVal8 = value);
                            },
                            value1: _switchVal8,
                            title: 'Reminders',
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h,),
                    ],
                  )
                ],
              ),
              SizedBox(height: 25.h,),
              Divider(height: 1.h, color: Overseer.grayColors,),
            ],
          ),
        ),
      ),
    );
  }
}
