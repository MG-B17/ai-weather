import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utilies/ColorManager.dart';

AlertDialog errorAlertDialog ({required String errorTittle,required String errorMessage})
{
  return AlertDialog(
    backgroundColor: ColorManager.containerColor,
    icon: Icon(
      Icons.error_outline,
      color: ColorManager.errorColor,
      size: 28.h,
    ),
    title:Text(
      errorTittle,
      style: TextStyle(
        color: ColorManager.errorColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold
      ),
    ),
    content:Text(
      errorMessage,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: ColorManager.textColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold
      ),
    ) ,
  );
}