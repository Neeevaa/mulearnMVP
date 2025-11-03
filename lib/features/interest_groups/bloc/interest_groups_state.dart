part of 'interest_groups_bloc.dart';

abstract class InterestGroupsState extends Equatable {
  const InterestGroupsState();

  @override
  List<Object> get props => [];
}

class InterestGroupsInitial extends InterestGroupsState {}

class InterestGroupsLoading extends InterestGroupsState {}

class InterestGroupsLoaded extends InterestGroupsState {
  final List<InterestGroup> groups;

  const InterestGroupsLoaded(this.groups);

  @override
  List<Object> get props => [groups];
}

class InterestGroupsError extends InterestGroupsState {
  final String message;

  const InterestGroupsError(this.message);

  @override
  List<Object> get props => [message];
}