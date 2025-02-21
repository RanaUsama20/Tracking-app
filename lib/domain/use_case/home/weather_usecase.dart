
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/domain/entities/home/forecast_entity.dart';
import '../../../core/network/errors/failure.dart';
import '../../repositories/home/weather_repo.dart';
@injectable
class FetchWeatherUseCase {
  final WeatherRepository repository;

  FetchWeatherUseCase(this.repository);

  Future<Either<Failure, ForecastResponseEntity>> call(double latitude, double longitude) async {
      final result = await repository.fetchWeatherData(latitude,longitude);
      return result.fold(
            (failure) => Left(failure),
            (forecast) => Right(forecast),
      );
    }

}
