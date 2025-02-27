import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utilies/ColorManager.dart';
import '../../../../core/utilies/strings.dart';
import '../../../../core/widget/boxDocration.dart';
import '../controller/cubit.dart';
import '../controller/states.dart';

class ErrorScreen extends StatelessWidget {
  final String message;

  ErrorScreen({required this.message});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: SafeArea(
            child: Container(
              decoration: myBoxDecoration(),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: message==ErrorMessage.PleaseEnableLoCation?AssetImage("assets/images/noLocation.png"):AssetImage("assets/images/no-wifi.png"),
                            width: 100.w,
                            height: 100.h,
                          ),
                          SizedBox(height: 10.h,),
                          Text(
                            message,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorManager.myWhite,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 10.h,),
                          InkWell(
                            onTap: (){
                              WeatherCubit.get(context).getCurrentWeather();
                            },
                            child: CircleAvatar(
                              radius: 25.r,
                              backgroundColor:ColorManager.containerColor ,
                              child:Icon(
                                Icons.refresh,
                                color: ColorManager.myWhite,
                                size: 28.h,
                              ) ,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
