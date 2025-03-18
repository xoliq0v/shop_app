//@GeneratedMicroModule;AppBlocPackageModule;package:app_bloc/src/di/init.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:app_bloc/app_bloc.dart' as _i3;
import 'package:app_bloc/src/di/init.dart' as _i5;
import 'package:core/core.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;

class AppBlocPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    final appBlocModule = _$AppBlocModule();
    gh.factory<_i3.InternetConnectivityController>(
        () => appBlocModule.provideInternetConnectivityController(
              gh<_i4.Connectivity>(),
              gh<_i4.InternetConnectionChecker>(),
            ));
  }
}

class _$AppBlocModule extends _i5.AppBlocModule {}
