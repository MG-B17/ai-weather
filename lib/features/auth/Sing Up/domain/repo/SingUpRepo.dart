import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/error/failure.dart';
import '../entity/SingUpEntity.dart';

abstract class SingUpRepo{
  Future<Either<Failure,UserCredential>> SingUp({required SingUpEntity singUpEntity});
}