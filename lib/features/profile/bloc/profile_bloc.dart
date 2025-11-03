import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/user_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);
    on<UpdateProfileImage>(_onUpdateProfileImage);
  }

  Future<void> _onLoadProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      // TODO: Implement API call to fetch profile
      emit(ProfileLoaded(UserProfile(
        id: '',
        name: '',
        email: '',
        interests: [],
        skills: {},
        achievements: [],
        karmaPoints: 0,
        rank: 0,
      )));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> _onUpdateProfile(
    UpdateProfile event,
    Emitter<ProfileState> emit,
  ) async {
    if (state is ProfileLoaded) {
      try {
        emit(ProfileLoading());
        // TODO: Implement API call to update profile
        emit(ProfileLoaded(event.profile));
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    }
  }

  Future<void> _onUpdateProfileImage(
    UpdateProfileImage event,
    Emitter<ProfileState> emit,
  ) async {
    if (state is ProfileLoaded) {
      try {
        emit(ProfileLoading());
        // TODO: Implement API call to update profile image
        emit(ProfileLoaded((state as ProfileLoaded).profile));
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    }
  }
}