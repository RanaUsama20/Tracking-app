import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:tracking_app/core/di/service_locator.config.dart';
import 'core/Themes/app_theme.dart';
import 'core/resources/values_manager.dart';
import 'core/routes/route_generator.dart';
import 'core/routes/routes.dart';
import 'core/utils/bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Bloc.observer = MyBlocObserver();
  await EasyLocalization.ensureInitialized();
    await GetIt.instance.init();

  runApp(
    EasyLocalization(
    supportedLocales: AppConstants.supportedLocales,
    fallbackLocale: AppConstants.englishLocale,
    path: AppConstants.pathTranslation,
        child: const MyApp()),
  );
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
