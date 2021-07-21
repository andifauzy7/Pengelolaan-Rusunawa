part of 'history_bloc.dart';

@immutable
abstract class HistoryState {
  const HistoryState();
}

class HistoryStateLoading extends HistoryState {}

class HistoryStateSuccess extends HistoryState {
  List<Rusunawa> daftarRusunawa;
  HistoryStateSuccess(this.daftarRusunawa);
}

class HistoryStateFailed extends HistoryState {
  String message;
  HistoryStateFailed(this.message);
}
