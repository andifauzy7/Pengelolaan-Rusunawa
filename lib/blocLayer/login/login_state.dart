part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class LoginStateSuccess extends LoginState {
  String message;
  LoginStateSuccess(this.message);
}

class LoginStateLoading extends LoginState {}

class LoginStateFailed extends LoginState {
  String message;
  LoginStateFailed(this.message);
}
