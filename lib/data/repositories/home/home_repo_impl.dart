import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/errors/exceptions.dart';
import 'package:tracking_app/domain/entities/home/forecast_entity.dart';
import '../../../core/network/errors/failure.dart';
import '../../../domain/repositories/home/weather_repo.dart';
import '../../data_sources/auth/remote/home_remote_data_source.dart';

@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final HomeRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ForecastResponseEntity>> fetchWeatherData(double latitude, double longitude) async {
    try {
      final response = await remoteDataSource.fetchWeatherData(latitude, longitude);
      return Right(response);
    } on ServerException catch (e) {
      return Left(Failure());
    } on RemoteException catch (e) {
      return Left(Failure());
    }
  }
}
