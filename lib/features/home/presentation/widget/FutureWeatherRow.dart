import 'package:aiweather/core/methods/mapCondtionToIamge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/methods/mapDatetoDayName.dart';
import '../../../../core/utilies/ColorManager.dart';
import '../../../../core/utilies/strings.dart';

class FutureWeatherRow extends StatelessWidget {

  final String day ;

  final int  code;

  final String maxC;

  final String minC;

  FutureWeatherRow({required this.maxC,required this.minC,required this.day,required this.code});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 9.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              mapDateToDayName(date: day),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.myWhite
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Image(
                image: AssetImage(mapCondtionToImage(condition: code)),
                width: 50.w,
                height: 50.h,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  Strings.min,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                  ),
                ),
                Text(
                  "${minC} C",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.myWhite
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  Strings.max,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                  ),
                ),
                Text(
                  "${maxC} C",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.myWhite
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
