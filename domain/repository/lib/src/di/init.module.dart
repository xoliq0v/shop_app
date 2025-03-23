//@GeneratedMicroModule;RepositoryPackageModule;package:repository/src/di/init.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:network/network.dart' as _i372;
import 'package:repository/src/di/init.dart' as _i49;
import 'package:repository/src/repository/product_repo.dart' as _i352;

class RepositoryPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final repositoryModule = _$RepositoryModule();
    gh.lazySingleton<_i352.ProductRepo>(
        () => repositoryModule.provideProductRepo(gh<_i372.ProductProvider>()));
  }
}

class _$RepositoryModule extends _i49.RepositoryModule {}
