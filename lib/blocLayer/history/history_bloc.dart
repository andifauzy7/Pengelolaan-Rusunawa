import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pengelolaan_rusunawa/dataLayer/model/responseRusunawa.dart';
import 'package:pengelolaan_rusunawa/dataLayer/remote/requestApi.dart';
import 'package:pengelolaan_rusunawa/dataLayer/session/sharedPreference.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryStateLoading());
  int idPasien;
  var result;

  @override
  Stream<HistoryState> mapEventToState(
    HistoryEvent event,
  ) async* {
    if(event is HistoryEventGetRusunawa) {
      yield HistoryStateLoading();
      try {
        idPasien = await SharedPreference.getId();
        result = await RequestApi.getAllPenggunaRusunawa(idPasien.toString());
        ResponseRusunawa rusunawa = ResponseRusunawa.fromJson(result);
        yield HistoryStateSuccess(rusunawa.data);
      } catch (e) {
        yield HistoryStateFailed(e.toString());
      }
    }

    if(event is HistoryEventDelete) {
      yield HistoryStateLoading();
      try {
        await RequestApi.deleteRusunawa(event.rusunawa.idRusunawa);
        idPasien = await SharedPreference.getId();
        result = await RequestApi.getAllPenggunaRusunawa(idPasien.toString());
        ResponseRusunawa rusunawa = ResponseRusunawa.fromJson(result);
        yield HistoryStateSuccess(rusunawa.data);
      } catch (e) {
        yield HistoryStateFailed(e.toString());
      }
    }
  }
}
