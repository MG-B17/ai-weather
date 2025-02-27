import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/theme/appTheme.dart';
import 'core/utilies/variables.dart';
import 'features/auth/Sing Up/presentation/controller/cubit.dart';
import 'features/auth/login/presentation/controller/cubit.dart';
import 'features/home/presentation/controller/cubit.dart';
import 'package:aiweather/core/di/di.dart'as di;

class AiWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=>di.sl<SingUpCubit>()),
            BlocProvider(create: (context)=>di.sl<LoginCubit>()),
            BlocProvider(create: (context)=>di.sl<WeatherCubit>()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appTheme(),
            home:Variables.screen,
          ),
        );
      },
    );
  }
}
