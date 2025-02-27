
import '../../domain/entity/currentWeatherEntity.dart';
import '../../domain/entity/forecastEntity.dart';

abstract  class WeatherStates {}

class InitialWeatherState extends WeatherStates{}

class LoadingGetCurrentWeather extends WeatherStates{}

class GetCurrentWeatherSuccess extends WeatherStates{
  final CurrentWeatherEntity currentWeatherEntity;

  GetCurrentWeatherSuccess({required this.currentWeatherEntity});
}

class GetCurrentWeatherFail extends WeatherStates{
  final String message;

  GetCurrentWeatherFail({required this.message});
}


class LoadingGetForecastWeather extends WeatherStates{}

class GetForecastWeatherSuccess extends WeatherStates{
  final List<ForecastEntity> forecastList;

  GetForecastWeatherSuccess({required this.forecastList});
}

class GetForecastWeatherFail extends WeatherStates{
  final String message;

  GetForecastWeatherFail({required this.message});
}



class LoadingGetAiPrediction extends WeatherStates{}

class GetAiPredictionSuccess extends WeatherStates{
final List prediction;

GetAiPredictionSuccess({required this.prediction});
}

class GetAiPredictionFail extends WeatherStates{
final String message;

GetAiPredictionFail({required this.message});
}
