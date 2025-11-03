import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final Dio _dio;
  final SharedPreferences _prefs;
  
  static const String baseUrl = 'https://api.mulearn.org/v1/'; // Replace with actual API endpoint

  ApiService(this._prefs) : _dio = Dio() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
    _dio.interceptors.add(_AuthInterceptor(_prefs));
  }

  // Authentication Endpoints
  Future<Response> login(String email, String password) async {
    return _dio.post('auth/login', data: {
      'email': email,
      'password': password,
    });
  }

  Future<Response> register(String name, String email, String password) async {
    return _dio.post('auth/register', data: {
      'name': name,
      'email': email,
      'password': password,
    });
  }

  // Profile Endpoints
  Future<Response> getProfile() async {
    return _dio.get('profile');
  }

  Future<Response> updateProfile(Map<String, dynamic> profileData) async {
    return _dio.put('profile', data: profileData);
  }

  // Interest Groups Endpoints
  Future<Response> getInterestGroups() async {
    return _dio.get('interest-groups');
  }

  Future<Response> joinInterestGroup(String groupId) async {
    return _dio.post('interest-groups/$groupId/join');
  }

  // Learning Circles Endpoints
  Future<Response> getLearningCircles() async {
    return _dio.get('learning-circles');
  }

  Future<Response> createLearningCircle(Map<String, dynamic> circleData) async {
    return _dio.post('learning-circles', data: circleData);
  }

  // Karma Points Endpoints
  Future<Response> getKarmaPoints() async {
    return _dio.get('karma');
  }

  Future<Response> getKarmaHistory() async {
    return _dio.get('karma/history');
  }

  // Events Endpoints
  Future<Response> getEvents() async {
    return _dio.get('events');
  }

  Future<Response> registerForEvent(String eventId) async {
    return _dio.post('events/$eventId/register');
  }

  // Opportunities Endpoints
  Future<Response> getOpportunities() async {
    return _dio.get('opportunities');
  }

  Future<Response> applyForOpportunity(String opportunityId) async {
    return _dio.post('opportunities/$opportunityId/apply');
  }
}

class _AuthInterceptor extends Interceptor {
  final SharedPreferences _prefs;

  _AuthInterceptor(this._prefs);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _prefs.getString('auth_token');
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Handle token expiration
      _prefs.remove('auth_token');
      // You might want to navigate to login screen here
    }
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}