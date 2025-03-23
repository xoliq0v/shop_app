
import 'dart:async';

import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:repository/src/repository/impl/banner_repo_impl.dart';
import 'package:repository/src/repository/impl/product_repo_impl.dart';
import 'package:repository/src/repository/product_repo.dart';

import '../repository/banner_repo.dart';

@module
abstract class RepositoryModule {


  @lazySingleton
  ProductRepo provideProductRepo(
    ProductProvider productProvider,
  ){
    return ProductRepoImpl(productProvider: productProvider);
  }

  @lazySingleton
  BannerRepo provideBannerRepo(
      BannerProvider bannerProvider
      ){
    return BannerRepoImpl(bannerProvider: bannerProvider);
  }
}

@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() {}