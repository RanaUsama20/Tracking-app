
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/errors/error_model.dart';
import 'package:tracking_app/core/network/remote/httpManager.dart';
import 'package:tracking_app/data/models/home/ForecastResponse.dart';
import 'package:tracking_app/domain/entities/home/forecast_entity.dart';
import '../../../../core/network/errors/exceptions.dart';
import '../../../../core/network/remote/api_constants.dart';
import '../../../../core/network/remote/api_manager.dart';

abstract class HomeRemoteDataSource {
  Future<ForecastResponseEntity> fetchWeatherData(double latitude, double longitude);
  Future<List<int>?> getPrediction(List<int> features);
}
@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiManager apiManager;
  final HttpManager httpManager;


  HomeRemoteDataSourceImpl(this.apiManager,this.httpManager);

  @override
  Future<ForecastResponseEntity> fetchWeatherData(double latitude, double longitude) async {
    try {
      Response response = await apiManager.getRequest(
        ApiConstants.daysForecastEndPoint,
        params: {
          "q": "$latitude,$longitude",
          "days": 3,
          "hour": 24,
        },
      );
      return ForecastResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException("Unknown server error" as ErrorModel);
    } catch (e) {
      throw RemoteException("Failed to fetch weather data");
    }
  }

  @override
  Future<List<int>?> getPrediction(List<int> features) async {
    return await httpManager.getPrediction(features);
  }


}
