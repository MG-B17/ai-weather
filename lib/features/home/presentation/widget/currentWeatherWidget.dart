import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilies/ColorManager.dart';

class CurrentWeatherWidget extends StatelessWidget {

  String region;

  String image;

  String temp;

  String contidion;


  CurrentWeatherWidget({
    required this.region,
    required this.image,
    required this.temp,
    required this.contidion,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: 1250),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              region,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorManager.myWhite,
                fontSize:18.sp ,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Image(
              image: AssetImage(image),
              width:110.w,
              height:100.h,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "${temp} C",
              style: TextStyle(
                  color: ColorManager.myWhite,
                  fontSize: 35.sp,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              contidion,
              style: TextStyle(
                  fontSize: 16.sp,
                  color: ColorManager.myWhite,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
