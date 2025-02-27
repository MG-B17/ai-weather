import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repo/repo.dart';

class GetAiPredictionUseCase{
  final WeatherRepo weatherRepo;

  GetAiPredictionUseCase({required this.weatherRepo});

  Future<Either<Failure,List>> call({required List data})async{
    return await weatherRepo.getPrediction(data: data);
  }
}