part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {
  const LoginEvent();
}

class LoginEventSubmit extends LoginEvent {
  String username, password;
  LoginEventSubmit(this.username, this.password);
}
