part of 'explore_bloc.dart';

@immutable
abstract class ExploreState {
  const ExploreState();
}

class ExploreStateLoading extends ExploreState {}

class ExploreStateSuccess extends ExploreState {
  List<Rusunawa> daftarRusunawa;
  ExploreStateSuccess(this.daftarRusunawa);
}

class ExploreStateFailed extends ExploreState {
  String message;
  ExploreStateFailed(this.message);
}
