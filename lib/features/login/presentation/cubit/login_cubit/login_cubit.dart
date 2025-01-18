import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_const.dart';
import 'package:movie_app/features/login/domain/entities/user_login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/service/di.dart';
import '../../../domain/usecases/authentication_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  UserLoginModel userLoginModel = UserLoginModel(email: '', password: '');

  Future<void> loginUser() async {
    try {
      emit(LoginLoading());
      await getIt<LoginUserUsecase>().loginUser(userLoginModel);
      getIt<SharedPreferences>()
          .setBool(AppConst.isLoginSharePreferences, true);
      emit(LoginLoaded());
    } on FirebaseAuthException catch (e) {
      emit(LoginError(
        errorMessage: e.message ?? '',
      ));
    }
  }
}
