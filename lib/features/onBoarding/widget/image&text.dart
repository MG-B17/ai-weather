import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utilies/ColorManager.dart';
import '../../../core/utilies/strings.dart';

class ImageAndText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
               const Color.fromRGBO(8, 36,79, 1),
                Color.fromRGBO(0, 73, 139, 1).withOpacity(0.2),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.11, 0.5],
            )
          ),
          child:FadeInUp(
            duration:const Duration(seconds: 2),
            child: Image(
                image:const AssetImage("assets/images/onboarding.png"),
                height: 535.h,
            ),
          ) ,
        ),
        FadeInUp(
          duration:const Duration(seconds: 1),
          child: Text(
            Strings.onBoardingStatement,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorManager.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
        )
      ],
    );
  }
}
