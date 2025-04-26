import 'dart:async';
import 'dart:convert';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:utils/utils.dart';

final class HTTPClient extends BaseHTTPClient {
  final List<InterceptorContract> _interceptors;

  const HTTPClient({
    List<InterceptorContract> interceptors = const [LoggerInterceptor()],
  }) : _interceptors = interceptors;

  @override
  Future<Result<T, HttpException>> sendRequest<T extends Object>({
    required String path,
    required HTTPMethod method,
    Map<String, dynamic>? body,
    MultipartFile? multipartBody,
    Map<String, String>? multipartFields,
    Map<String, String>? headers = const {'Content-Type': 'application/json'},
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    BaseRequest request;

    final uri = Uri.parse(path);

    if (multipartBody != null) {
      request = MultipartRequest(method.value, uri);
    } else {
      request = Request(method.value, uri);
    }

    // Add the headers to the request
    if (headers != null) {
      request.headers.addAll(headers);
    }

    // Add the body to the request
    if (body != null && request is Request) {
      request.body = jsonEncode(body);
      request.encoding = Encoding.getByName('utf-8')!;
    }

    if (multipartBody != null && request is MultipartRequest) {
      request.files.add(multipartBody);
    }

    if (multipartFields != null && request is MultipartRequest) {
      request.fields.addAll(multipartFields);
    }

    return _processResponse(request: request, fromJson: fromJson);
  }

  Future<Result<T, HttpException>> _processResponse<T extends Object>({
    required BaseRequest request,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    final client = InterceptedClient.build(
      interceptors: _interceptors,
      requestTimeout: const Duration(seconds: 30),
    );

    try {
      final streamedResponse = await client.send(request);
      final statusCode = streamedResponse.statusCode;

      if (statusCode >= 200 && statusCode < 300) {
        final response = await Response.fromStream(streamedResponse);

        if (fromJson == null) {
          return Success(response.body as T);
        }

        return Success(fromJson(jsonDecode(response.body)));
      }

      final error = await Response.fromStream(streamedResponse);

      return Failure(
        HttpException(statusCode: statusCode, message: error.body.toString()),
      );
    } catch (e) {
      return Failure(HttpException(statusCode: 500, message: e.toString()));
    } finally {
      client.close();
    }
  }
}
