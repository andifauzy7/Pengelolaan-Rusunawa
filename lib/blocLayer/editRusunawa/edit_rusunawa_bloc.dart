import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pengelolaan_rusunawa/dataLayer/remote/requestApi.dart';

part 'edit_rusunawa_event.dart';
part 'edit_rusunawa_state.dart';

class EditRusunawaBloc extends Bloc<EditRusunawaEvent, EditRusunawaState> {
  EditRusunawaBloc() : super(EditRusunawaInitial());

  @override
  Stream<EditRusunawaState> mapEventToState(
    EditRusunawaEvent event,
  ) async* {
    if(event is EditRusunawaEventSubmit){
      yield EditRusunawaStateLoading();
      try {
        var result = await RequestApi.editRusunawa(event.data, event.idRusunawa);
        if(result){
          yield EditRusunawaStateSuccess("Rusunawa berhasil diubah!");
        } else {
          yield EditRusunawaStateFailed("Rusunawa gagal diubah!");
        }
      } catch (e) {
        yield EditRusunawaStateFailed(e.toString());
      }
    }
  }
}
