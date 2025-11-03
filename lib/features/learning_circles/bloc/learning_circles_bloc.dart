import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/learning_circle.dart';

part 'learning_circles_event.dart';
part 'learning_circles_state.dart';

class LearningCirclesBloc extends Bloc<LearningCirclesEvent, LearningCirclesState> {
  LearningCirclesBloc() : super(LearningCirclesInitial()) {
    on<LoadLearningCircles>(_onLoadLearningCircles);
    on<JoinLearningCircle>(_onJoinLearningCircle);
    on<LeaveLearningCircle>(_onLeaveLearningCircle);
  }

  Future<void> _onLoadLearningCircles(
    LoadLearningCircles event,
    Emitter<LearningCirclesState> emit,
  ) async {
    emit(LearningCirclesLoading());
    try {
      // TODO: Implement API call to fetch learning circles
      emit(LearningCirclesLoaded([]));
    } catch (e) {
      emit(LearningCirclesError(e.toString()));
    }
  }

  Future<void> _onJoinLearningCircle(
    JoinLearningCircle event,
    Emitter<LearningCirclesState> emit,
  ) async {
    // TODO: Implement joining learning circle
  }

  Future<void> _onLeaveLearningCircle(
    LeaveLearningCircle event,
    Emitter<LearningCirclesState> emit,
  ) async {
    // TODO: Implement leaving learning circle
  }
}