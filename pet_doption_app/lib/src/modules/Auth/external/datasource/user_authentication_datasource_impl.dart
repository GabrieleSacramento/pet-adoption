import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_doption_app/src/modules/Auth/domain/entities/user_authentication_entity.dart';
import 'package:pet_doption_app/src/modules/Auth/infra/datasource/user_authentication_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAuthenticationDatasourceImpl implements UserAuthenticationDatasource {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Future<User> login(UserAuthenticationEntity user) async {
    try {
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        String uid = firebaseUser.uid; // Obter o UID do usuário
        String? token =
            await firebaseUser.getIdToken(); // Obter o token de autenticação

        // Armazenar o token no SharedPreferences
        // await prefs.setString('token', token!);

        // Faça algo com o UID e o token, se necessário
        print('UID: $uid');
        print('$token');

        return firebaseUser;
      } else {
        throw Exception('Erro ao fazer login: Usuário não encontrado.');
      }
    } on FirebaseAuthException catch (e) {
      throw Exception('Erro ao fazer login: ${e.message}');
    } catch (e) {
      throw Exception('Erro ao acessar SharedPreferences: $e');
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
