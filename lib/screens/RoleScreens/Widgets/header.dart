import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../controllers/MenuController.dart';
import '../../../responsive.dart';
import '../../ProfileScreen/profile_screen.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      color: Colors.white,
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: const Icon(
                Icons.menu,color: Colors.grey,
              ),
              onPressed: context.read<MenuController2>().controlMenu,
            ),
          SizedBox(width: 5.w),
          if (!Responsive.isMobile(context))
            SizedBox(
                height: Get.height*.045,
                width: Get.width*.230,
                child: const SearchField(
                  icon: (Icons.search),
                ),
            ),
          Spacer(),
          Container(
            height: Get.height*.045,
            width: Get.width*.030,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Overseer.adminBgColors,
            ),
            child: Center(
              child: Icon(
                Icons.notifications_outlined,
                color: Overseer.grayColors,
                size: 14.sp,
              ),
            ),
          ),
          SizedBox(width: Get.width *.010,),
          ProfileScreen(),
          SizedBox(width: Get.width *.020,),
        ],
      ),
    );
  }
}
class SearchField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChange;

  final IconData? icon;
  const SearchField({
    Key? key,  this.icon,  this.controller, this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:  TextStyle(
        color: Colors.black,
        fontSize: 16.sp
      ),

      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: "Search..",
        hintStyle: TextStyle(
          color: Overseer.grayColors,
              fontSize: 14.sp,
          fontWeight: FontWeight.w400
        ),
        fillColor: Overseer.textFieldColors,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius:  BorderRadius.all(Radius.circular(10.r)),
        ),
    suffixIcon: Icon(icon,color:Overseer.grayColors,)
      ),
    );
  }
}
