import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilies/ColorManager.dart';
import '../../../../../core/utilies/strings.dart';

class LoginStatment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image(
          image:const AssetImage("assets/images/Auth.png"),
          width: double.infinity,
          height: 280.h,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal:20.w,vertical: 30.h),
          child: Text(
            Strings.login,
            style: TextStyle(
                fontSize: 38.sp,
                fontWeight: FontWeight.bold,
                color: ColorManager.textColor
            ),
          ),
        ),
      ],
    );
  }
}
