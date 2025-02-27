import 'package:aiweather/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../entity/forecastEntity.dart';
import '../repo/repo.dart';

class GetForecastWeatherUSeCase {
  final WeatherRepo weatherRepo;

  GetForecastWeatherUSeCase({required this.weatherRepo});

  Future<Either<Failure,List<ForecastEntity>>>call()async{
    return await weatherRepo.getForecastWeather();
  }
}