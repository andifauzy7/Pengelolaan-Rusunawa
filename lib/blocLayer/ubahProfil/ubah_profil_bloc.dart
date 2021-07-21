import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pengelolaan_rusunawa/dataLayer/model/responseLogin.dart';
import 'package:pengelolaan_rusunawa/dataLayer/remote/requestApi.dart';
import 'package:pengelolaan_rusunawa/dataLayer/session/sharedPreference.dart';

part 'ubah_profil_event.dart';
part 'ubah_profil_state.dart';

class UbahProfilBloc extends Bloc<UbahProfilEvent, UbahProfilState> {
  UbahProfilBloc() : super(UbahProfilStateLoading());
  Data pengguna;

  @override
  Stream<UbahProfilState> mapEventToState(
    UbahProfilEvent event,
  ) async* {
    if (event is UbahProfilEventGetProfil) {
      yield UbahProfilStateLoading();
      try {
        pengguna = await SharedPreference.getDataPengguna();
        yield UbahProfilStateSuccess(pengguna);
      } catch (e) {
        yield UbahProfilStateFailed(e.toString());
      }
    }

    if (event is UbahProfilEventSubmit) {
      yield UbahProfilStateLoading();
      event.pengguna.idPengguna = pengguna.idPengguna;
      var result = await RequestApi.editPengguna(
          event.pengguna.toJson(), event.pengguna.idPengguna);
      if (result) {
        pengguna = event.pengguna;
        await SharedPreference.savePengguna(pengguna);
        yield UbahProfilStateSuccess(pengguna);
      } else {
        yield UbahProfilStateFailed("Ubah profil gagal!");
      }
    }
  }
}
