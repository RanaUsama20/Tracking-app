// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:tracking_app/core/di/register_modules.dart' as _i401;
import 'package:tracking_app/core/network/local/cache_helper.dart' as _i318;
import 'package:tracking_app/core/network/local/shared_preferences_cashed.dart'
    as _i249;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.instance,
      preResolve: true,
    );
    gh.singleton<_i318.CacheHelper>(
        () => _i249.SharedPreferencesCashed(gh<_i460.SharedPreferences>()));
    return this;
  }
}

class _$RegisterModule extends _i401.RegisterModule {}
