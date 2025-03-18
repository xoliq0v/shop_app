//@GeneratedMicroModule;CorePackageModule;package:core/src/di/init.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:core/core.dart' as _i494;
import 'package:core/src/di/init.dart' as _i546;
import 'package:core/src/env/env.dart' as _i368;
import 'package:injectable/injectable.dart' as _i526;

class CorePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final coreModule = _$CoreModule();
    gh.singleton<_i368.Env>(() => coreModule.provideDevEnv());
    gh.lazySingleton<_i494.Connectivity>(
        () => coreModule.provideConnectivity());
    gh.lazySingleton<String>(
      () => coreModule.provideBaseUrl(gh<_i368.Env>()),
      instanceName: 'base_url',
    );
    gh.lazySingleton<_i494.InternetConnectionChecker>(() =>
        coreModule.provideInternetConnectionChecker(
            gh<String>(instanceName: 'base_url')));
  }
}

class _$CoreModule extends _i546.CoreModule {}
