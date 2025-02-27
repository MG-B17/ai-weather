import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entity/currentWeatherEntity.dart';
import '../entity/forecastEntity.dart';

abstract class WeatherRepo {
  Future<Either<Failure, CurrentWeatherEntity>> getCurrentWeather();

  Future<Either<Failure,List<ForecastEntity>>> getForecastWeather();

  Future<Either<Failure,List>> getPrediction ({required List data});
}