part of 'edit_rusunawa_bloc.dart';

@immutable
abstract class EditRusunawaState {
  const EditRusunawaState();
}

class EditRusunawaInitial extends EditRusunawaState {}

class EditRusunawaStateLoading extends EditRusunawaState {}

class EditRusunawaStateSuccess extends EditRusunawaState {
  String message;
  EditRusunawaStateSuccess(this.message);
}

class EditRusunawaStateFailed extends EditRusunawaState {
  String message;
  EditRusunawaStateFailed(this.message);
}
