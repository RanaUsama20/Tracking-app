import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/errors/exceptions.dart';
import 'package:tracking_app/core/network/remote/api_constants.dart';
import 'api_interceptors.dart';
@injectable
class ApiManager{

  late Dio dio;

  ApiManager() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(ApiInterceptor());
  }

  Future<Response> getRequest(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      final response = await dio.get(endpoint, queryParameters: params);
      return response;
    }
    on DioException catch (e) {
       ServerException.handleDioException(e);
       rethrow;
    }
    catch (e) {
      throw RemoteException("Dio Error: $e");
    }
  }
}