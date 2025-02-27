import 'package:aiweather/core/helpers/cacheHelper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aiweather/core/di/di.dart'as di;
import 'AiWeather.dart';
import 'config/bloc_Observer.dart';
import 'core/helpers/DioHelper/dioHelper.dart';
import 'core/helpers/fireBase/fireBaseKey.dart';
import 'core/utilies/variables.dart';
import 'features/home/presentation/screen/Home.dart';
import 'features/onBoarding/onBoarding.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await ScreenUtil.ensureScreenSize();

  di.init();

  DioHelper.initialDio();

  AiDioHelper.initialDio();

  Bloc.observer = MyBlocObserver();

  checkLogin();

  runApp(AiWeather());

}

void checkLogin()async{
  String uid= await CacheHelper.getData(key: FireBaseKeys.uid)??"";
  if(uid.isNotEmpty){
    Variables.screen=Home();
  }else{
    Variables.screen=OnBoarding();
  }
}
