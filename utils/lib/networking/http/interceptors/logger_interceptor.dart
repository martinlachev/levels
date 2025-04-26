import 'dart:async';

import 'package:http/http.dart';
import 'package:http_interceptor/models/interceptor_contract.dart';

class LoggerInterceptor implements InterceptorContract {
  const LoggerInterceptor();

  @override
  FutureOr<BaseRequest> interceptRequest({required BaseRequest request}) {
    if (request is Request) {}

    return request;
  }

  @override
  FutureOr<BaseResponse> interceptResponse({required BaseResponse response}) {
    return response;
  }

  @override
  FutureOr<bool> shouldInterceptRequest() {
    return true;
  }

  @override
  FutureOr<bool> shouldInterceptResponse() {
    return false;
  }
}
