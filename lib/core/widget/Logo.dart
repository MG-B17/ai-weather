import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utilies/ColorManager.dart';
import '../utilies/strings.dart';

class Logo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h,bottom:30.h),
      child: Column(
        children: [
          Image(
            image:const AssetImage("assets/images/Logo.png"),
            width: 50.w,
            height: 50.h,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            Strings.appName,
            style: TextStyle(
                color: ColorManager.secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp
            ),
          )
        ],
      ),
    );
  }
}
