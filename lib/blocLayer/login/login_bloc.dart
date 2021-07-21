import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pengelolaan_rusunawa/dataLayer/model/responseLogin.dart';
import 'package:pengelolaan_rusunawa/dataLayer/remote/requestApi.dart';
import 'package:pengelolaan_rusunawa/dataLayer/session/sharedPreference.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginEventSubmit) {
      yield LoginStateLoading();
      try {
        var resultLogin = await RequestApi.loginPengguna(
            {'username': event.username, 'password': event.password});
        if (resultLogin != false) {
          var responseLogin = ResponseLogin.fromJson(resultLogin);
          await SharedPreference.savePengguna(responseLogin.data[0]);
          yield LoginStateSuccess("Login berhasil!");
        } else {
          yield LoginStateFailed("Login gagal, periksa akun anda!");
        }
      } catch (e) {
        yield LoginStateFailed(e.toString());
      }
    }
  }
}
