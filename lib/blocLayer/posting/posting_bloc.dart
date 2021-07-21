import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pengelolaan_rusunawa/dataLayer/remote/requestApi.dart';
import 'package:pengelolaan_rusunawa/dataLayer/session/sharedPreference.dart';

part 'posting_event.dart';
part 'posting_state.dart';

class PostingBloc extends Bloc<PostingEvent, PostingState> {
  PostingBloc() : super(PostingInitial());

  @override
  Stream<PostingState> mapEventToState(
    PostingEvent event,
  ) async* {
    if(event is PostingEventSubmit){
      yield PostingStateLoading();
      try {
        var idPengguna = await SharedPreference.getId();
        event.data["id_pengguna"] = idPengguna.toString();
        var result = await RequestApi.insertRusunawa(event.data);
        if(result){
          yield PostingStateSuccess("Rusunawa berhasil ditambahkan!");
        } else {
          yield PostingStateFailed("Rusunawa gagal ditambahkan!");
        }
      } catch (e) {
        yield PostingStateFailed(e.toString());
      }
    }
  }
}
