import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pengelolaan_rusunawa/dataLayer/model/responseInfoRusunawa.dart';
import 'package:pengelolaan_rusunawa/dataLayer/remote/requestApi.dart';
import 'package:pengelolaan_rusunawa/dataLayer/session/sharedPreference.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardStateLoading());

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if(event is DashboardEventGetInfo){
      yield DashboardStateLoading();
      try {
        int idPasien = await SharedPreference.getId();
        var result = await RequestApi.getInfoRusunawa(idPasien.toString());
        ResponseInfoRusunawa rusunawa = ResponseInfoRusunawa.fromJson(result);
        if(rusunawa.data.length != 0){
          yield DashboardStateSuccess(rusunawa.data[0]);
        } else {
          List<InfoRusunawa> dataRusun = [
            InfoRusunawa(
              totalRusunawa: 0.toString(),
              rusunawaPerbaikan: 0.toString(),
            )
          ];
          rusunawa.data = dataRusun;
          yield DashboardStateSuccess(rusunawa.data[0]);
        }
      } catch (e) {
        yield DashboardStateFailed(e.toString());
      }
    }
  }
}
