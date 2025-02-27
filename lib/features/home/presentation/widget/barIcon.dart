import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilies/ColorManager.dart';

class BarIcon extends StatelessWidget {

  String image;
  String text;

  BarIcon ({required this.text,required this.image});
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Row(
        children: [
          Image(
            image: AssetImage(image),
            width:18.w ,
            height:18.h ,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            text,
            style: TextStyle(
                color: ColorManager.myWhite,
                fontSize:14.sp ,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}
