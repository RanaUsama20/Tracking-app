// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:tracking_app/core/di/register_modules.dart' as _i401;
import 'package:tracking_app/core/network/local/cache_helper.dart' as _i318;
import 'package:tracking_app/core/network/local/shared_preferences_cashed.dart'
    as _i249;
import 'package:tracking_app/data/data_sources/auth/remote/auth_remote_data_source.dart'
    as _i79;
import 'package:tracking_app/data/repositories/auth/auth_repo_impl.dart'
    as _i687;
import 'package:tracking_app/domain/repositories/auth/auth_repo.dart' as _i281;
import 'package:tracking_app/domain/use_case/auth/login_usecase.dart' as _i725;
import 'package:tracking_app/domain/use_case/auth/register_usecase.dart'
    as _i176;
import 'package:tracking_app/ui/view_model/cubit/auth/auth_cubit.dart' as _i457;

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
    gh.lazySingleton<_i59.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(
        () => registerModule.firebaseFirestore);
    gh.factory<_i79.AuthRemoteDataSource>(() => _i79.AuthRemoteDataSourceImpl(
          gh<_i59.FirebaseAuth>(),
          gh<_i974.FirebaseFirestore>(),
        ));
    gh.singleton<_i318.CacheHelper>(
        () => _i249.SharedPreferencesCashed(gh<_i460.SharedPreferences>()));
    gh.factory<_i281.AuthRepository>(
        () => _i687.AuthRepositoryImpl(gh<_i79.AuthRemoteDataSource>()));
    gh.factory<_i725.LoginUseCase>(
        () => _i725.LoginUseCase(gh<_i281.AuthRepository>()));
    gh.factory<_i176.RegisterUseCase>(
        () => _i176.RegisterUseCase(gh<_i281.AuthRepository>()));
    gh.factory<_i457.AuthCubit>(() => _i457.AuthCubit(
          gh<_i725.LoginUseCase>(),
          gh<_i176.RegisterUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i401.RegisterModule {}
