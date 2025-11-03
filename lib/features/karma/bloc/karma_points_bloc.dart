import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/karma_points.dart';

part 'karma_points_event.dart';
part 'karma_points_state.dart';

class KarmaPointsBloc extends Bloc<KarmaPointsEvent, KarmaPointsState> {
  KarmaPointsBloc() : super(KarmaPointsInitial()) {
    on<LoadKarmaPoints>(_onLoadKarmaPoints);
    on<LoadKarmaActivities>(_onLoadKarmaActivities);
  }

  Future<void> _onLoadKarmaPoints(
    LoadKarmaPoints event,
    Emitter<KarmaPointsState> emit,
  ) async {
    emit(KarmaPointsLoading());
    try {
      // TODO: Implement API call to fetch karma points
      emit(KarmaPointsLoaded(KarmaPoints(
        total: 0,
        recentActivities: [],
        breakdown: {},
      )));
    } catch (e) {
      emit(KarmaPointsError(e.toString()));
    }
  }

  Future<void> _onLoadKarmaActivities(
    LoadKarmaActivities event,
    Emitter<KarmaPointsState> emit,
  ) async {
    if (state is KarmaPointsLoaded) {
      final currentState = state as KarmaPointsLoaded;
      emit(KarmaPointsLoading());
      try {
        // TODO: Implement API call to fetch more karma activities
        emit(KarmaPointsLoaded(currentState.karmaPoints));
      } catch (e) {
        emit(KarmaPointsError(e.toString()));
      }
    }
  }
}