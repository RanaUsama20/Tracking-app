import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/Themes/app_theme.dart';
import 'core/di/service_locator.dart';
import 'core/resources/values_manager.dart';
import 'core/routes/route_generator.dart';
import 'core/routes/routes.dart';
import 'core/utils/bloc_observer.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Bloc.observer = MyBlocObserver();
  await EasyLocalization.ensureInitialized();
  await configureDependencies();
  runApp(EasyLocalization(
    supportedLocales: AppConstants.supportedLocales,
    fallbackLocale: AppConstants.englishLocale,
    path: AppConstants.pathTranslation,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: false,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'Tracking app',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(context),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.login,
      ),
    );
  }
}
