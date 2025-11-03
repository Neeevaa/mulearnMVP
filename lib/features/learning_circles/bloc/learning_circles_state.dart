part of 'learning_circles_bloc.dart';

abstract class LearningCirclesState extends Equatable {
  const LearningCirclesState();

  @override
  List<Object> get props => [];
}

class LearningCirclesInitial extends LearningCirclesState {}

class LearningCirclesLoading extends LearningCirclesState {}

class LearningCirclesLoaded extends LearningCirclesState {
  final List<LearningCircle> circles;

  const LearningCirclesLoaded(this.circles);

  @override
  List<Object> get props => [circles];
}

class LearningCirclesError extends LearningCirclesState {
  final String message;

  const LearningCirclesError(this.message);

  @override
  List<Object> get props => [message];
}