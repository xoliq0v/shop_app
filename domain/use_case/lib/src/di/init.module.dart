//@GeneratedMicroModule;UseCasePackageModule;package:use_case/src/di/init.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:repository/repository.dart' as _i585;
import 'package:use_case/src/banner_use_case.dart' as _i34;
import 'package:use_case/src/di/init.dart' as _i854;
import 'package:use_case/src/impl/product_use_case_impl.dart' as _i17;
import 'package:use_case/src/product_use_case.dart' as _i321;

class UseCasePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final useCaseModule = _$UseCaseModule();
    gh.factory<_i321.FetchProduct>(
        () => useCaseModule.provideFetchProduct(gh<_i585.ProductRepo>()));
    gh.factory<_i17.FetchProductImpl>(
        () => _i17.FetchProductImpl(productRepo: gh<_i585.ProductRepo>()));
    gh.factory<_i34.FetchBanner>(
        () => useCaseModule.provideFetchBanner(gh<_i585.BannerRepo>()));
  }
}

class _$UseCaseModule extends _i854.UseCaseModule {}
