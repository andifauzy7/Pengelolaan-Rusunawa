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

  @override
  Stream<HistoryState> mapEventToState(
    HistoryEvent event,
  ) async* {
    if(event is HistoryEventGetRusunawa) {
      yield HistoryStateLoading();
      try {
        int idPasien = await SharedPreference.getId();
        var result = await RequestApi.getAllPenggunaRusunawa(idPasien.toString());
        ResponseRusunawa rusunawa = ResponseRusunawa.fromJson(result);
        yield HistoryStateSuccess(rusunawa.data);
      } catch (e) {
        yield HistoryStateFailed(e.toString());
      }
    }
  }
}
