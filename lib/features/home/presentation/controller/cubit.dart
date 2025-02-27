import 'package:aiweather/features/home/presentation/controller/states.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/handelError.dart';
import '../../domain/entity/currentWeatherEntity.dart';
import '../../domain/entity/forecastEntity.dart';
import '../../domain/usecase/getAiPredictionUseCase.dart';
import '../../domain/usecase/getCurrentWeatherUseCase.dart';
import '../../domain/usecase/getForecastWeatherUseCase.dart';

class WeatherCubit extends Cubit<WeatherStates>{

  final GetCurrentWeatherUSeCase getCurrentWeatherUSeCase;
  final GetForecastWeatherUSeCase getForecastWeatherUSeCase;
  final GetAiPredictionUseCase getAiPredictionUseCase;

  WeatherCubit({required this.getCurrentWeatherUSeCase,required this.getForecastWeatherUSeCase,required this.getAiPredictionUseCase}):super(InitialWeatherState());

  static WeatherCubit get(context)=>BlocProvider.of(context);

  Future<void> getCurrentWeather()async{
    emit(LoadingGetCurrentWeather());
    final Either<Failure,CurrentWeatherEntity> currentWeatherResult = await getCurrentWeatherUSeCase.call();
    currentWeatherResult.fold((failure)=>emit(GetCurrentWeatherFail(message: MapFailureToMessage(failure))),(r){
      emit(GetCurrentWeatherSuccess(currentWeatherEntity: r));
      getForecastWeather();
    });
  }

  Future<void> getForecastWeather()async{
    emit(LoadingGetForecastWeather());
    final Either<Failure,List<ForecastEntity>> forecastResult = await getForecastWeatherUSeCase.call();
    forecastResult.fold((failure)=>emit(GetForecastWeatherFail(message: MapFailureToMessage(failure))),(r)=>emit(GetForecastWeatherSuccess(forecastList: r)));
  }

  Future<void>getPrediction({required List data})async{
    emit(LoadingGetAiPrediction());
    final Either<Failure,List> result =await getAiPredictionUseCase.call(data: data);
    result.fold((failure)=>emit(GetAiPredictionFail(message: MapFailureToMessage(failure))),(r)=>emit(GetAiPredictionSuccess(prediction: r)));
  }
}