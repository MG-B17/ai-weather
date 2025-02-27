import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilies/ColorManager.dart';
import '../utilies/strings.dart';

AlertDialog aiDialog({required String image , required String message}){
  return AlertDialog(
    backgroundColor: ColorManager.myWhite.withOpacity(.9),
    icon:Image(
      image:AssetImage(image),
      width: 60.w,
      height: 60.h,
    ),
    title:Text(
      Strings.aiPrediction ,
      style: TextStyle(
          color: ColorManager.containerColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold
      ),
    ),
    content:Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.indigo,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold
      ),
    ),
  );
}