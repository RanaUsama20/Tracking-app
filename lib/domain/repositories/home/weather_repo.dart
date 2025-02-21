import 'package:either_dart/either.dart';
import 'package:tracking_app/domain/entities/home/forecast_entity.dart';

import '../../../core/network/errors/failure.dart';

abstract class WeatherRepository {
  Future<Either<Failure, ForecastResponseEntity>> fetchWeatherData(double latitude, double longitude);
}
