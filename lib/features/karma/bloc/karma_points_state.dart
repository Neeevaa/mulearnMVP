part of 'karma_points_bloc.dart';

abstract class KarmaPointsState extends Equatable {
  const KarmaPointsState();

  @override
  List<Object> get props => [];
}

class KarmaPointsInitial extends KarmaPointsState {}

class KarmaPointsLoading extends KarmaPointsState {}

class KarmaPointsLoaded extends KarmaPointsState {
  final KarmaPoints karmaPoints;

  const KarmaPointsLoaded(this.karmaPoints);

  @override
  List<Object> get props => [karmaPoints];
}

class KarmaPointsError extends KarmaPointsState {
  final String message;

  const KarmaPointsError(this.message);

  @override
  List<Object> get props => [message];
}