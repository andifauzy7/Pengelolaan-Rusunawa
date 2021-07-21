import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pengelolaan_rusunawa/dataLayer/model/responseRusunawa.dart';
import 'package:pengelolaan_rusunawa/dataLayer/remote/requestApi.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc() : super(ExploreStateLoading());

  @override
  Stream<ExploreState> mapEventToState(
    ExploreEvent event,
  ) async* {
    if(event is ExploreEventGetRusunawa){
      yield ExploreStateLoading();
      try {
        var result = await RequestApi.getAllRusunawa();
        ResponseRusunawa rusunawa = ResponseRusunawa.fromJson(result);
        yield ExploreStateSuccess(rusunawa.data);
      } catch (e) {
        yield ExploreStateFailed(e.toString());
      }
    }
  }
}
