import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/error/exception.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/network/network_checker.dart';
import '../../domain/entity/entity.dart';
import '../../domain/repo/repo.dart';
import '../remoteData/remoteData.dart';

class RepoImpl implements Repo{
  final NetworkInfo networkInfo;
  final RemoteData remoteData ;

  RepoImpl({required this.networkInfo,required this.remoteData});
  @override
  Future<Either<Failure, UserCredential>> login({required LoginEntity loginEntity})async {
    if(await networkInfo.isConnected()){
      try{
       final response= await remoteData.Login(loginEntity: loginEntity);
       return right(response);
      }on ServerException{
        return left(ServerFailure());
      }on WrongPasswordException{
        return left(WrongPasswordFailure());
      }
    }else{
      return left(OfflineFailure());
    }
  }

}