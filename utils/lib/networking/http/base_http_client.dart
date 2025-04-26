import 'package:http/http.dart';
import 'package:utils/utils.dart';

abstract class BaseHTTPClient {
  const BaseHTTPClient();

  Future<Result<T, HttpException>> sendRequest<T extends Object>({
    required String path,
    required HTTPMethod method,
    Map<String, dynamic>? body,
    MultipartFile? multipartBody,
    Map<String, String>? multipartFields,
    Map<String, String>? headers = const {'Content-Type': 'application/json'},
    T Function(Map<String, dynamic>)? fromJson,
  });
}
