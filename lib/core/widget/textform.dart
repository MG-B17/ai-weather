import 'package:aiweather/core/utilies/ColorManager.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextForm extends StatelessWidget {

   String name;
   TextEditingController controller;
   String? Function(String?)? validation;
   TextInputType keyboardType ;
   void Function(String)? onFiledSubmitted;
   void Function(String)? onChange;
   void Function()? onTap;
   bool hideInput;
   bool readOnly;
   IconData? preFixICon;
   IconData? sufFixICon;

  CustomTextForm({
   required this.name,
   required this.controller,
   required this.keyboardType,
    this.hideInput = false,
   required this.onFiledSubmitted,
   required this.validation,
    this.readOnly = false,
    this.onTap,
    required this.preFixICon,
    this.sufFixICon,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration:const Duration(seconds: 1),
      child: Padding(
        padding:EdgeInsets.symmetric(vertical:8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  fontSize: 18.sp,
                  color: ColorManager.textColor
              ),
            ),
            TextFormField(
              style: TextStyle(
                  color: ColorManager.secondaryColor,
                  fontSize: 16.sp
              ),

              decoration: InputDecoration(
                prefixIcon: Icon(
                  preFixICon,
                  color: ColorManager.secondaryColor,
                ),
                suffixIcon:IconButton(
                  onPressed: onTap,
                  icon: Icon(
                    sufFixICon,
                    color: ColorManager.secondaryColor,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide:const BorderSide(
                    color: Colors.white
                  )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(
                        color: ColorManager.secondaryColor
                    )
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(
                        color: ColorManager.errorColor
                    )
                )
              ),
              validator: validation,
              controller: controller,
              cursorColor: ColorManager.secondaryColor,
              keyboardType: keyboardType,
              onFieldSubmitted: onFiledSubmitted,
              obscureText: hideInput,
              readOnly: readOnly,
            ),
          ],
        ),
      ),
    );
  }
}
