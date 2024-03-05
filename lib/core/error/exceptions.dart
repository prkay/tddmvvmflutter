/// Exception thrown when error received from DistilLibrary.
/// The APIs won't work unless we have a distil token from the library
/// Thus, the APIs would stop working in case this exception is received
class DistilException implements Exception {
  final String error;
  DistilException(this.error);
}

class TokenRefreshException implements Exception {}

/// Exception thrown by Http Client when error received from server.
class HttpException implements Exception {
  final int? statusCode;
  final dynamic responseBody;
  final String? errorMessage;

  HttpException({
    this.statusCode,
    this.responseBody,
    this.errorMessage,
  });
}

// Exception thrown when error received when there is some issue with cache or json file reading.
class CacheException implements Exception {}
