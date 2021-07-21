part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {
  const RegisterEvent();
}

class RegisterEventSubmit extends RegisterEvent {
  String nama, username, password;
  RegisterEventSubmit(this.nama, this.username, this.password);
}
