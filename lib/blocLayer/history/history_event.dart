part of 'history_bloc.dart';

@immutable
abstract class HistoryEvent {
  const HistoryEvent();
}

class HistoryEventGetRusunawa extends HistoryEvent {}

class HistoryEventDelete extends HistoryEvent {
  Rusunawa rusunawa;
  HistoryEventDelete(this.rusunawa);
}
