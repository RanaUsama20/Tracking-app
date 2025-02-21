
import 'package:tracking_app/domain/entities/home/forecast_entity.dart';


abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeLoading extends HomeStates {}

class HomeSuccess extends HomeStates {

}

class HomeWeatherSuccess extends HomeStates {
 final ForecastResponseEntity weatherData;
 final ForecastdayEntity? selectedDay;

 HomeWeatherSuccess({required this.weatherData, this.selectedDay});

 HomeWeatherSuccess copyWith({ForecastdayEntity? selectedDay}) {
  return HomeWeatherSuccess(
   weatherData: weatherData,
   selectedDay: selectedDay ?? this.selectedDay,
  );
 }
}


class HomeFailure extends HomeStates {
 final String error;
 HomeFailure(this.error);
}



class HomeLocationUpdated extends HomeStates {
 final double latitude;
 final double longitude;
 HomeLocationUpdated(this.latitude, this.longitude);
}
