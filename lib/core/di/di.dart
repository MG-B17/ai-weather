import 'package:aiweather/features/home/data/rep_impl/weatherRepo_Imple.dart';
import 'package:aiweather/features/home/domain/repo/repo.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../../features/auth/Sing Up/data/remoteData/authRemoteData.dart';
import '../../features/auth/Sing Up/data/repoImpl/singUpRepoImpl.dart';
import '../../features/auth/Sing Up/domain/repo/SingUpRepo.dart';
import '../../features/auth/Sing Up/domain/useCase/SingUp_UseCase.dart';
import '../../features/auth/Sing Up/presentation/controller/cubit.dart';
import '../../features/auth/login/data/remoteData/remoteData.dart';
import '../../features/auth/login/data/repo_Impl/repo_Impl.dart';
import '../../features/auth/login/domain/repo/repo.dart';
import '../../features/auth/login/domain/usecase/loginUseCase.dart';
import '../../features/auth/login/presentation/controller/cubit.dart';
import '../../features/home/data/remoteData/aiRemoteData.dart';
import '../../features/home/data/remoteData/remoteWeatherData.dart';
import '../../features/home/domain/usecase/getAiPredictionUseCase.dart';
import '../../features/home/domain/usecase/getCurrentWeatherUseCase.dart';
import '../../features/home/domain/usecase/getForecastWeatherUseCase.dart';
import '../../features/home/presentation/controller/cubit.dart';
import '../network/network_checker.dart';

final sl = GetIt.instance;

Future<void> init()async{
  //cubit
  sl.registerFactory(()=>LoginCubit(loginUseCase: sl()));
  sl.registerFactory(()=>SingUpCubit(singUpUseCase: sl()));
  sl.registerFactory(()=>WeatherCubit(getCurrentWeatherUSeCase: sl(),getForecastWeatherUSeCase: sl(),getAiPredictionUseCase: sl())..getCurrentWeather());

  //useCase
  sl.registerLazySingleton<LoginUseCase>(()=>LoginUseCase(repo: sl()));
  sl.registerLazySingleton<SingUpUseCase>(()=>SingUpUseCase(singUpRepo: sl()));
  sl.registerLazySingleton<GetCurrentWeatherUSeCase>(()=>GetCurrentWeatherUSeCase(weatherRepo: sl()));
  sl.registerLazySingleton<GetForecastWeatherUSeCase>(()=>GetForecastWeatherUSeCase(weatherRepo: sl()));
  sl.registerLazySingleton<GetAiPredictionUseCase>(()=>GetAiPredictionUseCase(weatherRepo: sl()));

  //repo
  sl.registerLazySingleton<Repo>(()=>RepoImpl(networkInfo: sl(), remoteData:sl()));
  sl.registerLazySingleton<SingUpRepo>(()=>SingUpRepoImpl(singUpRemote: sl(), networkInfo: sl()));
  sl.registerLazySingleton<WeatherRepo>(()=>CurrentWeatherImpel(networkInfo: sl(), baseRemoteWeatherData: sl(),baseAiRemoteData: sl()));

  //remoteData
  sl.registerLazySingleton<RemoteData>(()=>RemoteDataLogin());
  sl.registerLazySingleton<SingUpRemote>(()=>SingUpRemoteImpl());
  sl.registerLazySingleton<BaseRemoteWeatherData>(()=>RemoteWeatherData());
  sl.registerLazySingleton<BaseAiRemoteData>(()=>AiRemoteData());

  //other
  sl.registerLazySingleton<NetworkInfo>(()=>NetworkInfoImpl(internetConnection: InternetConnection()));
}