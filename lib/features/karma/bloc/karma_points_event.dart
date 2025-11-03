part of 'karma_points_bloc.dart';

abstract class KarmaPointsEvent extends Equatable {
  const KarmaPointsEvent();

  @override
  List<Object> get props => [];
}

class LoadKarmaPoints extends KarmaPointsEvent {}

class LoadKarmaActivities extends KarmaPointsEvent {
  final int page;

  const LoadKarmaActivities({this.page = 1});

  @override
  List<Object> get props => [page];
}