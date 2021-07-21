part of 'register_bloc.dart';

@immutable
abstract class RegisterState {
  const RegisterState();
}

class RegisterStateInitial extends RegisterState {}

class RegisterStateSuccess extends RegisterState {
  String message;
  RegisterStateSuccess(this.message);
}

class RegisterStateLoading extends RegisterState {}

class RegisterStateFailed extends RegisterState {
  String message;
  RegisterStateFailed(this.message);
}
