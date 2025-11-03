part of 'learning_circles_bloc.dart';

abstract class LearningCirclesEvent extends Equatable {
  const LearningCirclesEvent();

  @override
  List<Object> get props => [];
}

class LoadLearningCircles extends LearningCirclesEvent {}

class JoinLearningCircle extends LearningCirclesEvent {
  final String circleId;

  const JoinLearningCircle(this.circleId);

  @override
  List<Object> get props => [circleId];
}

class LeaveLearningCircle extends LearningCirclesEvent {
  final String circleId;

  const LeaveLearningCircle(this.circleId);

  @override
  List<Object> get props => [circleId];
}