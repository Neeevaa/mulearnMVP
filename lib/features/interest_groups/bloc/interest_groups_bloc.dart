import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/interest_group.dart';

part 'interest_groups_event.dart';
part 'interest_groups_state.dart';

class InterestGroupsBloc extends Bloc<InterestGroupsEvent, InterestGroupsState> {
  InterestGroupsBloc() : super(InterestGroupsInitial()) {
    on<LoadInterestGroups>(_onLoadInterestGroups);
    on<JoinInterestGroup>(_onJoinInterestGroup);
    on<LeaveInterestGroup>(_onLeaveInterestGroup);
  }

  Future<void> _onLoadInterestGroups(
    LoadInterestGroups event,
    Emitter<InterestGroupsState> emit,
  ) async {
    emit(InterestGroupsLoading());
    try {
      // TODO: Implement API call to fetch interest groups
      emit(InterestGroupsLoaded([]));
    } catch (e) {
      emit(InterestGroupsError(e.toString()));
    }
  }

  Future<void> _onJoinInterestGroup(
    JoinInterestGroup event,
    Emitter<InterestGroupsState> emit,
  ) async {
    // TODO: Implement joining interest group
  }

  Future<void> _onLeaveInterestGroup(
    LeaveInterestGroup event,
    Emitter<InterestGroupsState> emit,
  ) async {
    // TODO: Implement leaving interest group
  }
}