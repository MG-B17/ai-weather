import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilies/ColorManager.dart';
import '../../../../../core/utilies/strings.dart';

class ForgetPassword extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: (){},
              child: Text(
                Strings.forgetPassword,
                style: TextStyle(
                    color:ColorManager.textColor,
                    fontSize: 15.sp
                ),
              )
          )
        ],
      ),
    );
  }
}
