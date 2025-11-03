import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/services/api_service.dart';
import '../models/auth_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiService _apiService;
  final SharedPreferences _prefs;

  AuthBloc(this._apiService, this._prefs) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<CheckAuthStatus>(_onCheckAuthStatus);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final response = await _apiService.login(event.email, event.password);
      final authResponse = AuthResponse.fromJson(response.data);
      await _prefs.setString('auth_token', authResponse.token);
      emit(Authenticated(authResponse.user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final response = await _apiService.register(
        event.name,
        event.email,
        event.password,
      );
      final authResponse = AuthResponse.fromJson(response.data);
      await _prefs.setString('auth_token', authResponse.token);
      emit(Authenticated(authResponse.user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _prefs.remove('auth_token');
    emit(AuthInitial());
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    final token = _prefs.getString('auth_token');
    if (token != null) {
      try {
        final response = await _apiService.getProfile();
        final user = User.fromJson(response.data);
        emit(Authenticated(user));
      } catch (e) {
        await _prefs.remove('auth_token');
        emit(AuthInitial());
      }
    } else {
      emit(AuthInitial());
    }
  }
}