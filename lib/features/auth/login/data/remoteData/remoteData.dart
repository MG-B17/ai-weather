import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/error/exception.dart';
import '../../../../../core/helpers/cacheHelper.dart';
import '../../../../../core/helpers/fireBase/fireBaseKey.dart';
import '../../domain/entity/entity.dart';

abstract class RemoteData {
  Future<UserCredential> Login({required LoginEntity loginEntity});
}

class RemoteDataLogin implements RemoteData{
  @override
  Future<UserCredential> Login({required LoginEntity loginEntity})async {
    try{
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email:loginEntity.email, password:loginEntity.password);
      print(userCredential);
      CacheHelper.setData(key: FireBaseKeys.uid, value: userCredential.user!.uid);
      return userCredential;
    }on FirebaseAuthException catch (e) {
      if (e.code=="invalid-credential")
      {
        print("invalid-credential");
        throw WrongPasswordException();
      }
      else{
        throw ServerException();
      }
  }
  }
}