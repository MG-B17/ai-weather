import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utilies/ColorManager.dart';
import '../../../../core/utilies/strings.dart';
import '../../../../core/widget/ai dialog.dart';
import '../../domain/entity/currentWeatherEntity.dart';
import '../controller/cubit.dart';
import '../controller/states.dart';

class HomeBar extends StatelessWidget {

  String location;

  int cloud;

  int humidity;

  double temp;

  HomeBar({required this.location,required this.temp,required this.humidity,required this.cloud});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration:const Duration(milliseconds: 750),
      child: Padding(
        padding:EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        child: BlocConsumer<WeatherCubit,WeatherStates>(
          listener: (context,state){
            if(state is GetAiPredictionSuccess){
              if(state.prediction[0]==0){
                showDialog(context: context, builder:(context)=>aiDialog(message:Strings.cannotGetOut ,image:"assets/images/sadRoboot.gif" ));
              }else {
                showDialog(context: context, builder:(context)=>aiDialog(message:Strings.canGetOut ,image: "assets/images/happyRoboot.gif"));
              }
            }
          },
          builder:(context,state){
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: ColorManager.myWhite,
                  weight: 20.h,
                ),
                Text(
                  location,
                  style: TextStyle(
                      color: ColorManager.myWhite,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap:(){
                    WeatherCubit.get(context).getPrediction(
                        data: createAiData(
                            temp:temp,
                            cloud:cloud,
                            humidity:humidity
                        )
                    );
                  },
                  child: Image(
                    image:const AssetImage("assets/images/roobot.gif"),
                    width: 60.w,
                    height: 60.h,
                  ),
                ),
              ],
            );
          } ,
        ),
      ),
    );
  }
}
