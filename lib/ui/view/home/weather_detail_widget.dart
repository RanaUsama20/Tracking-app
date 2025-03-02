import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/ui/components/weather_details_card.dart';
import '../../../domain/entities/home/forecast_entity.dart';

class WeatherDetailWidget extends StatelessWidget {
  final ForecastdayEntity? selectedDay;

  const WeatherDetailWidget({super.key, this.selectedDay});
  @override
  Widget build(BuildContext context) {
    if (selectedDay == null) {
      return Center(child: Text("Select a day to view details"));
    }
          final details = [
            {
              'label': 'Max Temperature',
              'icon': Icons.thermostat,
              'value': '${selectedDay!.day!.maxtempC ?? 0}°C'
            },
            {
              'label': 'Humidity',
              'icon': Icons.water_drop,
              'value': '${selectedDay!.day!.avghumidity ?? 0}%'
            },
            {
              'label': 'Wind Speed',
              'icon': Icons.air,
              'value': '${selectedDay!.day!.maxwindKph ?? 0} km/h'
            },
            {
              'label': 'Chance of Rain',
              'icon': Icons.cloudy_snowing,
              'value': '${selectedDay!.day!.dailyChanceOfRain ?? 0}%'
            },
          ];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: details.length,
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemBuilder: (context, index) {
                return WeatherDetailsCard(
                  label: details[index]['label'].toString(),
                  icon: details[index]['icon'] as IconData,
                  value: details[index]['value'].toString(),
                );
              },
            ),
          );

  }
}
