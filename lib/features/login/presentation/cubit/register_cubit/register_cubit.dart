import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/login/domain/entities/user_login_model.dart';

import '../../../../../core/service/di.dart';
import '../../../domain/usecases/authentication_usecase.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  UserLoginModel user = UserLoginModel(email: '', password: '');

  Future<void> regiterUser() async {
    try {
      emit(RegisterLoading());
      await getIt<LoginUserUsecase>().register(user);
      emit(RegisterLoaded());
      
    } on FirebaseAuthException catch (e) {
      emit(RegisterError(errorMessage: e.message ?? ''));
    }
  }
}
