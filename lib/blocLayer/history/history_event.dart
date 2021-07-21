part of 'history_bloc.dart';

@immutable
abstract class HistoryEvent {
  const HistoryEvent();
}

class HistoryEventGetRusunawa extends HistoryEvent {}
