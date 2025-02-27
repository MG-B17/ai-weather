import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/error/exception.dart';
import '../../../../../core/helpers/cacheHelper.dart';
import '../../../../../core/helpers/fireBase/fireBaseKey.dart';
import '../../domain/entity/SingUpEntity.dart';

abstract class SingUpRemote{
  Future<UserCredential> singUp({required SingUpEntity singUpEntity});

  void createUser({required SingUpEntity singUpEntity, required String uid});
}

class SingUpRemoteImpl extends SingUpRemote {
  @override
  Future<UserCredential> singUp({required SingUpEntity singUpEntity}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: singUpEntity.email, password: singUpEntity.password);
      CacheHelper.setData(key: FireBaseKeys.uid, value: credential.user!.uid);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeekPassException();
      } else if (e.code == 'email-already-in-use') {
        throw ExistedAccountException();
      } else {
        throw ServerException();
      }
    }
  }

  @override
  void createUser({required SingUpEntity singUpEntity, required String uid}) async {
    try {
      await FirebaseFirestore.instance.
      collection(FireBaseKeys.userDataBaseName)
          .doc(uid).collection(FireBaseKeys.usersTableName)
          .add(
          {
            FireBaseKeys.userName: singUpEntity.userName,
            FireBaseKeys.email: singUpEntity.email,
            FireBaseKeys.birthDate: singUpEntity.birthDate,
            FireBaseKeys.weight: singUpEntity.weight,
            FireBaseKeys.height: singUpEntity.height,
            FireBaseKeys.uid: uid,
          }
      );
    } catch (e) {
      print("Failed to add user: $e");
    }
  }
}