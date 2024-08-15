import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_doption_app/src/modules/Auth/domain/entities/user_authentication_entity.dart';
import 'package:pet_doption_app/src/modules/Auth/infra/datasource/user_authentication_datasource.dart';

class UserAuthenticationDatasourceImpl implements UserAuthenticationDatasource {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Future<User> login(UserAuthenticationEntity user) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      return userCredential.user!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> signup(UserAuthenticationEntity user) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      return userCredential.user!;
    } catch (e) {
      rethrow;
    }
  }
}
