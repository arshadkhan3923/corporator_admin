import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../Tab_update_provider.dart';
import '../../RoleScreens/Widgets/expansion_tile_widgets.dart';
import '../../../responsive.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);
  @override
  State<SideMenu> createState() => _SideMenuState();
}
class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context){
    return Drawer(
      backgroundColor: Overseer.bgColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 180.h,
                width: double.infinity,
                color: Overseer.whiteColors,
                child: Center(
                    child: Image.asset("assets/images/Logo_Png_Orange.png",
                      fit: BoxFit.fitWidth,
                    ),
                ),
            ),
          Padding(
            padding: EdgeInsets.only(left: 15.w,top: 10.h),
          child: Column(
            children: [
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                    return InkWell(
                      onTap: (){
                        provider.indexUpdate(0);
                      },
                      child: SizedBox(
                        height: 50.h,
                        child: Row(
                          children: [
                            SizedBox(width: 15.w,),
                            Image.asset('assets/icons/dashboard_icon.png',color: Overseer.whiteColors,),
                            SizedBox(width: 15.w,),
                            Text('Dashboard',
                              style: TextStyle(
                                fontSize: Responsive.isDesktop(context)?24.sp:
                                Responsive.isTablet(context)?16.sp:
                                Responsive.isTablet(context)?14.sp:24.sp,
                                fontWeight: FontWeight.w500,
                                color: Overseer.whiteColors,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                    return InkWell(
                      onTap: (){
                        provider.indexUpdate(1);
                      },
                      child: SizedBox(
                        height: 50.h,
                        child: Row(
                          children: [
                            SizedBox(width: 15.w,),
                            Image.asset('assets/icons/workspaces_icon.png',color: Overseer.whiteColors,),
                            SizedBox(width: 15.w,),
                            Text('Workspaces',
                              style: TextStyle(
                                fontSize: Responsive.isDesktop(context)?24.sp:
                                Responsive.isTablet(context)?16.sp:
                                Responsive.isTablet(context)?14.sp:24.sp,
                                fontWeight: FontWeight.w500,
                                color: Overseer.whiteColors,
                              ),
                            )
                          ],
                        ),
                      ),

                    );
                  }),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                    return InkWell(
                      onTap: (){
                        Overseer. editVisi=false;
                        Overseer. viewVisi=false;
                        provider.indexUpdate(2);
                      },
                      child: SizedBox(
                        height: 60.h,
                        child: Row(
                          children: [
                            SizedBox(width: 15.w,),
                            Image.asset("assets/icons/role_icon.png"),
                            SizedBox(width: 15.w,),
                            Text('All Roles',
                              style: TextStyle(
                                fontSize: Responsive.isDesktop(context)?24.sp:
                                Responsive.isTablet(context)?16.sp:
                                Responsive.isTablet(context)?14.sp:24.sp,
                                fontWeight: FontWeight.w500,
                                color: Overseer.whiteColors,
                              ),
                            )
                          ],
                        ),
                      ),

                    );
                  }),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                    return DrawerListExpansionTile(
                      title: 'Users',
                      text: 'View All User',
                      text1: 'Add New User',
                      image: 'assets/icons/user_icon.png',
                      voidCallback1: (){
                        Overseer. editVisi=false;
                        Overseer. viewVisi=false;
                        provider.indexUpdate(3);
                      },
                      voidCallback2: (){
                        Overseer. viewVisi=false;
                        Overseer. editVisi=false;
                        provider.indexUpdate(4);
                      },
                    );
                  }
              ),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                    return InkWell(
                      onTap: (){
                        Overseer. editVisi=false;
                        Overseer. viewVisi=false;
                        provider.indexUpdate(5);
                      },
                      child: SizedBox(
                        height: 60.h,
                        child: Row(
                          children: [
                            SizedBox(width: 15.w,),
                            Image.asset("assets/icons/memory_icon.png",
                              color: Overseer.whiteColors,
                            ),
                            SizedBox(width: 15.w,),
                            Text('Memory Quota',
                              style: TextStyle(
                                fontSize: Responsive.isDesktop(context)?24.sp:
                                Responsive.isTablet(context)?16.sp:
                                Responsive.isTablet(context)?14.sp:24.sp,
                                fontWeight: FontWeight.w500,
                                color: Overseer.whiteColors,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                    return InkWell(
                      onTap: (){
                        Overseer. editVisi=false;
                        Overseer. viewVisi=false;
                        provider.indexUpdate(6);
                      },
                      child: SizedBox(
                        height: 60.h,
                        child: Row(
                          children: [
                            SizedBox(width: 15.w,),
                            Icon( Icons.local_activity_outlined,
                              size: 20.sp,
                              color: Overseer.whiteColors,
                            ),
                            SizedBox(width: 15.w,),
                            Text('All Activities',
                              style: TextStyle(
                                fontSize: Responsive.isDesktop(context)?24.sp:
                                Responsive.isTablet(context)?16.sp:
                                Responsive.isTablet(context)?14.sp:24.sp,
                                fontWeight: FontWeight.w500,
                                color: Overseer.whiteColors,
                              ),
                            )
                          ],
                        ),
                      ),

                    );
                  }),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                    return InkWell(
                      onTap: (){
                        provider.indexUpdate(7);
                      },
                      child: SizedBox(
                        height: 50.h,
                        child: Row(
                          children: [
                            SizedBox(width: 15.w,),
                            Image.asset('assets/icons/downloads_icon.png',color: Overseer.whiteColors,),
                            SizedBox(width: 15.w,),
                            Text('Downloads Activities',
                              style: TextStyle(
                                fontSize: Responsive.isDesktop(context)?24.sp:
                                Responsive.isTablet(context)?16.sp:
                                Responsive.isTablet(context)?14.sp:24.sp,
                                fontWeight: FontWeight.w500,
                                color: Overseer.whiteColors,
                              ),
                            )
                          ],
                        ),
                      ),

                    );
                  }),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                    return InkWell(
                      onTap: (){
                        Overseer. editVisi=false;
                        Overseer. viewVisi=false;
                        provider.indexUpdate(8);
                      },
                      child: SizedBox(
                        height: 60.h,
                        child: Row(
                          children: [
                            SizedBox(width: 15.w,),
                            Image.asset('assets/icons/uploads_icon.png',color: Overseer.whiteColors,),
                            SizedBox(width: 15.w,),
                            Text('Upload Activities',
                              style: TextStyle(
                                fontSize: Responsive.isDesktop(context)?24.sp:
                                Responsive.isTablet(context)?16.sp:
                                Responsive.isTablet(context)?14.sp:24.sp,
                                fontWeight: FontWeight.w500,
                                color: Overseer.whiteColors,
                              ),
                            )
                          ],
                        ),
                      ),

                    );
                  }),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                    return InkWell(
                      onTap: (){
                        provider.indexUpdate(9);
                      },
                      child: SizedBox(
                        height: 50.h,
                        child: Row(
                          children: [
                            SizedBox(width: 16.w,height: 15.h,),
                            Image.asset(
                              'assets/icons/settings_icon.png',
                              color: Overseer.whiteColors,
                            ),
                            SizedBox(width: 15.w,),
                            Text('Settings',style: TextStyle(
                              color: Overseer.whiteColors,
                              fontWeight: FontWeight.w400,
                              fontSize: Responsive.isDesktop(context)?24.sp:
                              Responsive.isTablet(context)?16.sp:
                              Responsive.isTablet(context)?14.sp:24.sp,
                             ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ],
          ),
          )
          ],
        ),
      ),
    );
  }
}