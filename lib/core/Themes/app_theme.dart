import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        scaffoldBackgroundColor: ColorManager.lightGray,
        primaryColor: ColorManager.blue,
        appBarTheme: AppBarTheme(
          centerTitle: false,
          backgroundColor: ColorManager.lightGray,
          elevation: 0,
          titleTextStyle: getBoldStyle(
            color: ColorManager.darkGray,
            fontSize: FontSize.s20,
            fontFamily: AppConstants.inter,
            context: context,
          ),
        ),
    textTheme: TextTheme(
      titleLarge:getBoldStyle(
          color: ColorManager.steelBlue,
          fontSize: FontSize.s30,
          fontFamily: AppConstants.inter,
          context: context
      ) ,
      titleMedium: getBoldStyle(
          color: ColorManager.darkGray,
          fontSize: FontSize.s18,
          fontFamily: AppConstants.inter,
          context: context
      ),
      titleSmall: getRegularStyle(
          color: ColorManager.mediumGray,
          fontSize: FontSize.s14,
          fontFamily: AppConstants.inter,
          context: context)
    )
      );
}
