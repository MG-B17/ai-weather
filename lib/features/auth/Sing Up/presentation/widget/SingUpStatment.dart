import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilies/ColorManager.dart';
import '../../../../../core/utilies/strings.dart';

class SingUpStatement extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image(
          image:const AssetImage("assets/images/Auth.png"),
          width: double.infinity,
          height: 250.h,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal:15.w,vertical: 20.h),
          child: Text(
            Strings.singUp,
            style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: ColorManager.textColor
            ),
          ),
        ),
      ],
    );
  }
}
