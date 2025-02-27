import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/error/failure.dart';
import '../entity/SingUpEntity.dart';
import '../repo/SingUpRepo.dart';

class SingUpUseCase{
  final SingUpRepo singUpRepo;

  SingUpUseCase({required this.singUpRepo});

  Future<Either<Failure,UserCredential>>call({required SingUpEntity singUpEntity})async{
    return await singUpRepo.SingUp(singUpEntity: singUpEntity);
  }
}