class CacheException implements Exception {}

class TimeOutException implements Exception {}

class APIFetchException implements Exception {
  final String message;

  APIFetchException({required this.message});
}
