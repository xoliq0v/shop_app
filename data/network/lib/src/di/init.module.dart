//@GeneratedMicroModule;NetworkPackageModule;package:network/src/di/init.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:dio/dio.dart' as _i361;
import 'package:injectable/injectable.dart' as _i526;
import 'package:network/network.dart' as _i372;
import 'package:network/src/di/init.dart' as _i101;
import 'package:network/src/di/provider_module.dart' as _i561;
import 'package:network/src/interceptor/basic_auth.dart' as _i713;

class NetworkPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final networkModule = _$NetworkModule();
    final networkProviderModule = _$NetworkProviderModule();
    gh.lazySingleton<_i713.BasicAuthInterceptor>(
        () => networkModule.provideAuthInterceptor());
    gh.factory<_i361.BaseOptions>(() =>
        networkModule.provideBaseOptions(gh<String>(instanceName: 'base_url')));
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.provideAuthDio(
        gh<_i361.BaseOptions>(),
        gh<_i713.BasicAuthInterceptor>(),
      ),
      instanceName: 'auth_dio',
    );
    gh.lazySingleton<_i361.Dio>(() => networkModule.provideDio(
          gh<_i361.BaseOptions>(),
          gh<_i713.BasicAuthInterceptor>(),
        ));
    gh.lazySingleton<_i372.ProductProvider>(
        () => networkProviderModule.provideProductProvider(gh<_i361.Dio>()));
    gh.lazySingleton<_i372.BannerProvider>(
        () => networkProviderModule.provideBannerProvider(gh<_i361.Dio>()));
  }
}

class _$NetworkModule extends _i101.NetworkModule {}

class _$NetworkProviderModule extends _i561.NetworkProviderModule {}
