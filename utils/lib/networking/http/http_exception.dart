class HttpException implements Exception {
  final int statusCode;
  final String message;

  const HttpException({
    required this.statusCode,
    required this.message,
  });

  @override
  String toString() {
    return 'HttpException{statusCode: $statusCode, message: $message}';
  }
}
