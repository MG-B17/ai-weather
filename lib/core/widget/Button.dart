import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  String text ;
  double width ;
  void Function() onTap;
  Color containerColor;

  Button({required this.text,required this.width,required this.onTap,required this.containerColor});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration:const Duration(seconds: 1),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: 45.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color:containerColor
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp
              ),
            ),
          ),
        ),
      ),
    );
  }
}
