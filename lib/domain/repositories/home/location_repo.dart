
import '../../entities/home/forecast_entity.dart';

abstract class LocationRepository {
  Future<LocationEntity> getUserLocation();
}