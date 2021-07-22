part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {
  const DashboardState();
}

class DashboardStateLoading extends DashboardState {}

class DashboardStateSuccess extends DashboardState {
  InfoRusunawa infoRusunawa;
  DashboardStateSuccess(this.infoRusunawa);
}

class DashboardStateFailed extends DashboardState {
  String message;
  DashboardStateFailed(this.message);
}
