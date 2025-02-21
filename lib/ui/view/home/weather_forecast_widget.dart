import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/core/resources/color_manager.dart';
import 'package:tracking_app/ui/view_model/cubit/home/home_cubit.dart';
import 'package:tracking_app/ui/view_model/cubit/home/home_states.dart';

import '../../../core/utils/ui_utils.dart';
import '../../components/weather_card.dart';

class WeatherForecastWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
      if (state is HomeLoading) {
        return Center(
            child: CircularProgressIndicator(
          color: ColorManager.skyBlue,
        ));
      } else if (state is HomeFailure) {
        UiUtils.showMessageToast(state.error);

      } else if (state is HomeWeatherSuccess) {
        final forecastDays =
            state.weatherData.forecast!.forecastday!.take(3).toList();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('3-Days Forecasts',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 20)),
              Text(
                  '${state.weatherData.location!.name},${state.weatherData.location!.region},${state.weatherData.location!.country}',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 20)),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 200.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    final day = forecastDays[index];
                    final isSelected = state.selectedDay == day;
                    return InkWell(
                      onTap: () {
                        context.read<HomeCubit>().selectDay(day);
                      },
                      child: WeatherCard(
                        icon: day.day!.condition!.icon,
                        temp: day.day!.avgtempC ?? 0,
                        condition: day.day!.condition!.text ?? 'N/A',
                        date: day.date ?? 'Unknown',
                        isSelected: isSelected,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }
      return Container();
    });
  }
}
