

import '../../entities/home/forecast_entity.dart';
import '../../repositories/home/location_repo.dart';

class GetUserLocationUseCase {
  final LocationRepository repository;

  GetUserLocationUseCase(this.repository);

  Future<LocationEntity> call() {
    return repository.getUserLocation();
  }
}
