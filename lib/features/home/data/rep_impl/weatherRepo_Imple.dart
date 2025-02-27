import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/helpers/loactionHelper/locationHelper.dart';
import '../../../../core/network/network_checker.dart';
import '../../domain/entity/currentWeatherEntity.dart';
import '../../domain/entity/forecastEntity.dart';
import '../../domain/repo/repo.dart';
import '../remoteData/aiRemoteData.dart';
import '../remoteData/remoteWeatherData.dart';

class CurrentWeatherImpel extends WeatherRepo{

  final BaseRemoteWeatherData baseRemoteWeatherData;

  final BaseAiRemoteData baseAiRemoteData;

  final NetworkInfo networkInfo;

  CurrentWeatherImpel({required this.networkInfo,required this.baseRemoteWeatherData,required this.baseAiRemoteData});

  @override
  Future<Either<Failure, CurrentWeatherEntity>> getCurrentWeather()async {
    if(await networkInfo.isConnected()){
      try{
        final Either<Failure,Position> location = await LocationManager().determinePosition();
        return await  location.fold((failure){
          return left(LocationDisabledFailure());
        }, (r)
        async{
          final  String latitude= r.latitude.toString();
          final  String longitude= r.latitude.toString();
          final response = await baseRemoteWeatherData.getCurrentWeather(location:"${latitude},${longitude}" );
          return right(response);
        });
      } on ServerException{
        return left(ServerFailure());
      }
    }else{
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure,List<ForecastEntity>>> getForecastWeather()async{
    if(await networkInfo.isConnected()){
    try{
      final Either<Failure,Position> location = await LocationManager().determinePosition();
      return await  location.fold((failure){
        return left(LocationDisabledFailure());
      }, (r)
      async{
        final  String latitude= r.latitude.toString();
        final  String longitude= r.latitude.toString();
        final response = await baseRemoteWeatherData.getForeCastWeather(location:"${latitude},${longitude}");
        return right(response);
      });
    } on ServerException{
    return left(ServerFailure());
    }
    }else{
    return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure,List>> getPrediction({required List data})async {
    if(await networkInfo.isConnected()){
      try{
        final result=await baseAiRemoteData.getPrediction(data: data);
        return right(result);
      }on AiRequestsException{
        return left(AiPredictionFailure());
      }
    }else{
      return left(OfflineFailure());
    }

  }
}