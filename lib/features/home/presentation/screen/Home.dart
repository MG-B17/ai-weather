import 'package:aiweather/features/home/domain/entity/currentWeatherEntity.dart';
import 'package:aiweather/features/home/domain/entity/forecastEntity.dart';
import 'package:aiweather/features/home/presentation/controller/cubit.dart';
import 'package:aiweather/features/home/presentation/controller/states.dart';
import 'package:aiweather/features/home/presentation/widget/currentWeatherWidget.dart';
import 'package:aiweather/features/home/presentation/widget/locationWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aiweather/core/di/di.dart' as di;

import '../../../../core/methods/mapCondtionToIamge.dart';
import '../../../../core/widget/boxDocration.dart';
import '../widget/bar.dart';
import '../widget/nextForecastWidget.dart';
import 'errorScreen.dart';
import 'loadingScreen.dart';


class Home extends StatelessWidget {

  List<ForecastEntity> forecast =[];

  CurrentWeatherEntity? currentWeatherEntity;

  bool isLoading = false;

  String message ="";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>di.sl<WeatherCubit>(),
      child: BlocConsumer<WeatherCubit,WeatherStates>(
        listener: (context,state){
          if(state is GetForecastWeatherSuccess){
            forecast=state.forecastList;
            message="";
          }
         else if(state is GetCurrentWeatherSuccess){
             currentWeatherEntity= state.currentWeatherEntity;
             message="";
           }
         else if (state is GetForecastWeatherFail){
           message= state.message;
          }
         else if (state is GetCurrentWeatherFail){
           message=state.message;
          }
        },
        builder: (context,state){
          if(state is LoadingGetCurrentWeather || state is LoadingGetForecastWeather){
           return LoadingScreen();
          }
          else if(message.isNotEmpty){
            return ErrorScreen(message: message);
          }
          else{
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: myBoxDecoration(),
                    child:Column(
                      children: [
                       currentWeatherEntity != null? Column(
                          children: [
                            HomeBar(
                              location:currentWeatherEntity!.country,
                                temp: currentWeatherEntity!.temp,
                                cloud: currentWeatherEntity!.cloud,
                                humidity: currentWeatherEntity!.humidity
                            ),
                            CurrentWeatherWidget(
                              region:currentWeatherEntity!.region,
                              image: mapCondtionToImage(condition:currentWeatherEntity!.id),
                              temp: "${currentWeatherEntity!.temp}",
                              contidion:currentWeatherEntity!.condition,
                            ),
                            WeatherInfoBar(
                                humidity: "${currentWeatherEntity!.humidity}",
                                wind_kph: currentWeatherEntity!.wind_kph,
                                dewPoint_c: currentWeatherEntity!.dewPoint_c
                            ),
                          ],
                        ) :const SizedBox(),
                        NextForecastWidget(list:forecast),
                        SizedBox(
                          height: 10.h,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
