import 'package:dio/dio.dart';
import 'package:tracking_app/core/network/remote/api_constants.dart';

class ApiInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      "key": ApiConstants.apiKey,
    });
    options.headers.addAll({
      "accept": "application/json",
    });

    super.onRequest(options, handler);
  }
}
