import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:tracking_app/core/location/location_services.dart';
import 'package:tracking_app/core/resources/color_manager.dart';
import 'package:tracking_app/core/utils/ui_utils.dart';
import 'package:tracking_app/domain/use_case/home/weather_usecase.dart';
import 'package:tracking_app/ui/view/home/weather_detail_widget.dart';
import 'package:tracking_app/ui/view/home/weather_forecast_widget.dart';

import '../../view_model/cubit/home/home_cubit.dart';
import '../../view_model/cubit/home/home_states.dart';


class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeCubit cubit = HomeCubit(
    GetIt.instance<LocationManager>(),
    GetIt.instance<FetchWeatherUseCase>(),
  );
@override
  Widget build(BuildContext context) {
  return BlocProvider<HomeCubit>(
    create: (context) => cubit..fetchWeatherData(),
    child: Scaffold(
      appBar: AppBar(title: Text('Weather Forecast')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            if (state is HomeFailure){
              UiUtils.showMessageToast(state.error);
            }
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
                ],
              );
            }
            return Center(child: CircularProgressIndicator(color: ColorManager.skyBlue,));
          },
        ),
      ),
    ),
  );
  }
}




