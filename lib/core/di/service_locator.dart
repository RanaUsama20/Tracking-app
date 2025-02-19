import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_app/core/di/service_locator.config.dart';

final serviceLocator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await serviceLocator.init();
  await serviceLocator.isReady<SharedPreferences>();
}