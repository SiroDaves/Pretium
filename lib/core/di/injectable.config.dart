// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretium/core/di/injectable.dart' as _i721;
import 'package:pretium/domain/auth_repository.dart' as _i668;
import 'package:pretium/domain/prefs_repository.dart' as _i389;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> initGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => registerModule.prefsRepository(),
      preResolve: true,
    );
    gh.lazySingleton<_i668.AuthRepository>(() => _i668.AuthRepository());
    gh.singleton<_i389.PrefsRepository>(
        () => _i389.PrefsRepository(gh<_i460.SharedPreferences>()));
    return this;
  }
}

class _$RegisterModule extends _i721.RegisterModule {}
