part of 'edit_rusunawa_bloc.dart';

@immutable
abstract class EditRusunawaEvent {
  const EditRusunawaEvent();
}

class EditRusunawaEventSubmit extends EditRusunawaEvent {
  Map<String, dynamic> data;
  String idRusunawa;
  EditRusunawaEventSubmit(this.data, this.idRusunawa);
}
