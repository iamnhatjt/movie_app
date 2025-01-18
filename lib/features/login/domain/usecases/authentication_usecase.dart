import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/features/login/domain/entities/user_login_model.dart';

import '../../../../core/service/di.dart';

class LoginUserUsecase {
  Future<void> loginUser(UserLoginModel user) async {
    try {
      await getIt<FirebaseAuth>().signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<void> register(UserLoginModel user) async {
    try {
      await getIt<FirebaseAuth>().createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
    } on FirebaseAuthException {
      rethrow;
    }
  }
}
