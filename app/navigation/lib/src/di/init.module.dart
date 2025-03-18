//@GeneratedMicroModule;NavigationPackageModule;package:navigation/src/di/init.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:navigation/navigation.dart' as _i1058;
import 'package:navigation/src/di/init.dart' as _i684;

class NavigationPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final navigationModule = _$NavigationModule();
    gh.singleton<_i1058.AppRouter>(() => navigationModule.provideAppRoute());
    gh.lazySingleton<_i1058.MainRoutes>(
        () => navigationModule.provideMainRoutes());
    gh.lazySingleton<_i1058.MainNavigation>(
        () => navigationModule.provideMainNavigator(gh<_i1058.AppRouter>()));
  }
}

class _$NavigationModule extends _i684.NavigationModule {}
