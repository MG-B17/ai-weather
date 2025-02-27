import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utilies/ColorManager.dart';
import 'barIcon.dart';

class WeatherInfoBar extends StatelessWidget {
  final String wind_kph;

  final String humidity;

  final String dewPoint_c;

  WeatherInfoBar({required this.humidity,required this.wind_kph, required this.dewPoint_c});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration:const Duration(milliseconds: 1750),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
        child: Container(
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color:  ColorManager.containerColor,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BarIcon(text: "${dewPoint_c} %", image: "assets/images/dewIcon.png"),
                BarIcon(text: "${humidity} %", image: "assets/images/humidityIcon.png"),
                BarIcon(text: "${wind_kph} Km/H", image: "assets/images/windSpeedIcon.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
