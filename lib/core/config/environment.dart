class Environment {
  static const String apiUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'https://api.mulearn.org/v1/',
  );

  static const bool useHttps = bool.fromEnvironment(
    'USE_HTTPS',
    defaultValue: true,
  );

  static const int connectTimeout = int.fromEnvironment(
    'CONNECT_TIMEOUT',
    defaultValue: 5000,
  );

  static const int receiveTimeout = int.fromEnvironment(
    'RECEIVE_TIMEOUT',
    defaultValue: 3000,
  );
}