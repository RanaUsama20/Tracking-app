import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/core/di/service_locator.dart';
import 'package:tracking_app/core/resources/color_manager.dart';
import 'package:tracking_app/core/utils/ui_utils.dart';
import 'package:tracking_app/ui/view/home/weather_detail_widget.dart';
import 'package:tracking_app/ui/view/home/weather_forecast_widget.dart';

import '../../../generated/locale_keys.g.dart';
import '../../view_model/cubit/home/home_cubit.dart';
import '../../view_model/cubit/home/home_states.dart';
import 'Prediction_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeCubit cubit = serviceLocator<HomeCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => cubit..fetchWeatherData(),
      child: Scaffold(
        appBar: AppBar(title: Text(LocaleKeys.weatherForecast.tr())),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<HomeCubit, HomeStates>(
            listener: (context, state) {
              if (state is HomeFailure) {
                UiUtils.showMessageToast(state.error);
              }
              if (state is HomePredictionSuccess) {
                UiUtils.showPredictionDialog(context, state.prediction, () {
                  Navigator.of(context).pop();
                  cubit.fetchWeatherData();
                });
              }
            },
            builder: (context, state) {
              if (state is HomeWeatherSuccess) {
                return Column(
                  children: [
                    WeatherForecastWidget(),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: WeatherDetailWidget(
                        selectedDay: state.selectedDay,
                      ),
                    ),
                    PredictionWidget(),
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  color: ColorManager.skyBlue,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
