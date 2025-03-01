import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../../core/network/errors/failure.dart';
import '../../repositories/home/weather_repo.dart';

@injectable
class GetPredictionUseCase {
  final WeatherRepository weatherRepository;

  GetPredictionUseCase(this.weatherRepository);

  Future<Either<Failure, List<int>?>> call(List<int> features) async {
    final result = await weatherRepository.getPrediction(features);
    return result.fold(
          (failure) => Left(failure),
          (result) => Right(result),
    );
  }
}