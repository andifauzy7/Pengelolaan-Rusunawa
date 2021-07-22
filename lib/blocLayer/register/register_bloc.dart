import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pengelolaan_rusunawa/dataLayer/remote/requestApi.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterStateInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if(event is RegisterEventSubmit){
      yield RegisterStateLoading();
      try {
        var resultValidasi = await RequestApi.validasiPengguna({
          'username' : event.username
        });

        if(resultValidasi){
          var resultRegistrasi = await RequestApi.registerPengguna({
            'nama_pengguna' : event.nama,
            'username' : event.username,
            'password' : event.password
          });
          if(resultRegistrasi){
            yield RegisterStateSuccess("Registrasi Berhasil!");
          } else {
            yield RegisterStateFailed("Registrasi Gagal!");
          }

        } else {
          yield RegisterStateFailed("Username anda telah terdaftar!");
        }
      } catch (e) {
        yield RegisterStateFailed(e.toString());
      }
    }
  }
}
