import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../Tab_update_provider.dart';
import '../../RoleScreens/Widgets/expansion_tile_widgets.dart';

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
                child: Center(child: Image.asset("assets/images/Logo_Png_Orange.png",fit: BoxFit.fitWidth,))),

          Padding(
            padding: EdgeInsets.only(left: 15.w,top: 10.h),
          child: Column(
            children: [
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                    return Padding(
                      padding:  EdgeInsets.only(left: 15.w,top: 10.h),
                      child: InkWell(
                        onTap: (){
                          provider.indexUpdate(0);
                        },
                        child: Row(
                          children: [
                            Image.asset('assets/icons/dashboard_icon.png',color: Overseer.whiteColors,),
                            SizedBox(width: 15.w,),
                            Text('Dashboard',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: Overseer.whiteColors,
                              ),
                            )
                          ],
                        ),

                      ),
                    );
                  }),
              SizedBox(height: 16.h,),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                    return ExpansionTile(
                        iconColor: Colors.white,
                        title:  Row(
                          children: [
                            Image.asset("assets/icons/workspaces_icon.png",
                              color: Overseer.whiteColors,
                            ),
                            SizedBox(width: 15.w,),
                            Text("Workspaces",
                              style: TextStyle(
                                color: Overseer.whiteColors,
                                fontWeight: FontWeight.w400,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                        backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.025),
                        children: <Widget>[
                          ListTile(
                            onTap: (){
                              provider.indexUpdate(1);
                            },
                            title: Text("View All Workspaces",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: Overseer.whiteColors,
                              ),
                            ),
                          ),
                        ]
                    );
                  }
              ),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                    return DrawerListExpansionTile(
                      title: 'Roles',
                      text: 'View All Roles',
                      text1: 'Add New Roles',
                      image: 'assets/icons/role_icon.png',
                      voidCallback1: (){
                        provider.indexUpdate(2);
                      },
                      voidCallback2: (){
                        provider.indexUpdate(2);
                      },
                    );
                  }
              ),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                    return DrawerListExpansionTile(
                      title: 'Users',
                      text: 'View All User',
                      text1: 'Add New User',
                      image: 'assets/icons/user_icon.png',
                      voidCallback1: (){
                        provider.indexUpdate(3);
                      },
                      voidCallback2: (){
                        provider.indexUpdate(4);
                      },
                    );
                  }
              ),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                    return DrawerListExpansionTile(
                      title: 'Memory Quota',
                      text: 'View Memory Quota',
                      text1: 'Add Memory Quota',
                      image: 'assets/icons/memory_icon.png',
                      voidCallback1: (){
                        provider.indexUpdate(5);
                      },
                      voidCallback2: (){
                        provider.indexUpdate(5);
                      },
                    );
                  }
              ),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                    return ExpansionTile(
                        iconColor: Overseer.whiteColors,
                        title:  Row(
                          children: [
                            Icon( Icons.local_activity_outlined,
                              size: 20.sp,
                              color: Overseer.whiteColors,
                            ),
                            SizedBox(width: 15.w,),
                            Text("All Activities",style: TextStyle(
                              color: Overseer.whiteColors,
                              fontWeight: FontWeight.w400,
                              fontSize: 20.sp,
                            ),
                            ),
                          ],
                        ),
                        backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.025),
                        children: <Widget>[
                          ListTile(
                            onTap: (){
                              provider.indexUpdate(6);
                            },
                            title: Text("View All Activity",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: Overseer.whiteColors,
                              ),
                            ),
                          ),
                        ]
                    );
                  }
              ),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                    return ExpansionTile(
                        iconColor:Overseer.whiteColors,
                        title:  Row(
                          children: [
                            Image.asset("assets/icons/downloads_icon.png",color: Overseer.whiteColors,),
                            SizedBox(width: 15.w,),
                            Text("Downloads Activities",style: TextStyle(
                              color: Overseer.whiteColors,
                              fontWeight: FontWeight.w400,
                              fontSize: 20.sp,
                            ),
                            ),
                          ],
                        ),
                        backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.025),
                        children: <Widget>[
                          ListTile(
                            onTap: (){
                              provider.indexUpdate(7);
                            },
                            title: Text("View All Downloads",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: Overseer.whiteColors,
                              ),
                            ),
                          ),
                        ]
                    );
                  }
              ),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                    return ExpansionTile(
                        iconColor: Colors.white,
                        title:  Row(
                          children: [
                            Image.asset("assets/icons/uploads_icon.png",color: Overseer.whiteColors,),
                            SizedBox(width: 15.w,),
                            Text("Upload Activities",style: TextStyle(
                              color: Overseer.whiteColors,
                              fontWeight: FontWeight.w400,
                              fontSize: 20.sp,
                            ),
                            ),
                          ],
                        ),
                        backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.025),
                        children: <Widget>[
                          ListTile(
                            onTap: (){
                              provider.indexUpdate(8);
                            },
                            title: Text("View All Upload",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: Overseer.whiteColors,
                              ),
                            ),
                          ),
                        ]
                    );
                  }
              ),
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
                              fontSize: 20.sp,
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