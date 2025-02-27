import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/error/failure.dart';
import '../entity/entity.dart';
import '../repo/repo.dart';

class LoginUseCase {
  final Repo repo;

  LoginUseCase({required this.repo});

  Future<Either<Failure,UserCredential>> call({required LoginEntity loginEntity})async{
    return await repo.login(loginEntity: loginEntity);
    }
}