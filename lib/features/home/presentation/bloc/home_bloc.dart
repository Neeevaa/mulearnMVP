import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadHomeData extends HomeEvent {}

// States
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<dynamic> events;
  final List<dynamic> opportunities;
  final Map<String, dynamic> statistics;

  const HomeLoaded({
    required this.events,
    required this.opportunities,
    required this.statistics,
  });

  @override
  List<Object?> get props => [events, opportunities, statistics];
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object?> get props => [message];
}

// Bloc
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
  }

  Future<void> _onLoadHomeData(LoadHomeData event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoading());
      
      // Simulate loading data
      await Future.delayed(const Duration(seconds: 1));
      
      // TODO: Replace with actual API calls
      final events = [];
      final opportunities = [];
      final statistics = {
        'karma_points': 0,
        'tasks_completed': 0,
        'learning_circles': 0,
      };
      
      emit(HomeLoaded(
        events: events,
        opportunities: opportunities,
        statistics: statistics,
      ));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}