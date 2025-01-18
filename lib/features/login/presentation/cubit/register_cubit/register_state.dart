part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterLoaded extends RegisterState {}

class RegisterError extends RegisterState {
  final String errorMessage;
  const RegisterError({
    required this.errorMessage,
  });
  @override
  List<Object> get props => [];
}
