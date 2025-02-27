
import 'package:flutter/material.dart';

import '../../core/utilies/ColorManager.dart';

ThemeData appTheme(){
  return ThemeData(
    primaryColor: ColorManager.primaryColor,
    scaffoldBackgroundColor: ColorManager.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.primaryColor
    ),
    fontFamily: "Kanit"
  );
}