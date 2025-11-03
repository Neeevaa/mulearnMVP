part of 'interest_groups_bloc.dart';

abstract class InterestGroupsEvent extends Equatable {
  const InterestGroupsEvent();

  @override
  List<Object> get props => [];
}

class LoadInterestGroups extends InterestGroupsEvent {}

class JoinInterestGroup extends InterestGroupsEvent {
  final String groupId;

  const JoinInterestGroup(this.groupId);

  @override
  List<Object> get props => [groupId];
}

class LeaveInterestGroup extends InterestGroupsEvent {
  final String groupId;

  const LeaveInterestGroup(this.groupId);

  @override
  List<Object> get props => [groupId];
}