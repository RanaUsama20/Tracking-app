import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/widgets/custom_button.dart';
import '../../view_model/cubit/home/home_cubit.dart';

class PredictionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(
          label: 'Get Prediction'.tr(),
          onTap: () {
            context.read<HomeCubit>().fetchPrediction();
          },
        ),
    );
  }

}
