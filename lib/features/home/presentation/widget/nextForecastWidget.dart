import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utilies/ColorManager.dart';
import '../../../../core/utilies/strings.dart';
import '../../domain/entity/forecastEntity.dart';
import 'FutureWeatherRow.dart';

class NextForecastWidget extends StatelessWidget {

  final List<ForecastEntity> list;

  const NextForecastWidget({required this.list});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration:const Duration(seconds: 2),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Container(
          width:double.infinity,
          height: 250.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color:  ColorManager.containerColor,
          ),
          child: Padding(
            padding:EdgeInsets.symmetric(horizontal:16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    Strings.nextForecast,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorManager.myWhite,
                      fontSize:18.sp ,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context,index)=>FutureWeatherRow(
                                maxC: list[index].maxTemp,
                                minC: list[index].minTemp,
                                day: list[index].date,
                                code: list[index].id
                            ),
                          itemCount:list.length ,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
