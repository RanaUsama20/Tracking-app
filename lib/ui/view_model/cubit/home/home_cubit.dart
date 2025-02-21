import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/domain/entities/home/forecast_entity.dart';

import '../../../../core/location/location_services.dart';
import '../../../../domain/use_case/home/weather_usecase.dart';
import 'home_states.dart';

@injectable
class HomeCubit extends Cubit<HomeStates> {
  final LocationManager locationManager;
  final FetchWeatherUseCase getWeatherUseCase;

  double? latitude;
  double? longitude;
  ForecastdayEntity? selectedDay;

  HomeCubit(this.locationManager, this.getWeatherUseCase) : super(HomeInitial());

  Future<bool> trackUserData() async {
    var locationData = await locationManager.getUserLocation();

    if (locationData != null) {
      latitude = locationData.latitude;
      longitude = locationData.longitude;
      emit(HomeLocationUpdated(latitude!, longitude!));
      return true;
    } else {
      emit(HomeFailure("Failed to get location"));
      return false;
    }
  }

  Future<void> fetchWeatherData() async {
    emit(HomeLoading());

    bool locationFetched = await trackUserData();
    if (!locationFetched || latitude == null || longitude == null) {
      emit(HomeFailure("Failed to get location"));
      return;
    }

    final result = await getWeatherUseCase(latitude!, longitude!);

    result.fold(
          (failure) => emit(HomeFailure(failure.errorModel!.message.toString())),
          (forecast) {
        final firstDay = forecast.forecast!.forecastday!.first;
        emit(HomeWeatherSuccess(weatherData: forecast, selectedDay: firstDay));
      },
    );
  }

  void selectDay(ForecastdayEntity day) {
    final currentState = state;
    if (currentState is HomeWeatherSuccess) {
      emit(currentState.copyWith(selectedDay: day));
    }
  }
}
