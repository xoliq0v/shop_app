
import 'dart:async';

import 'package:core/core.dart';
import 'package:repository/repository.dart';
import 'package:use_case/src/banner_use_case.dart';
import 'package:use_case/src/impl/banner_use_case_impl.dart';
import 'package:use_case/src/impl/product_use_case_impl.dart';
import 'package:use_case/src/product_use_case.dart';

@module
abstract class UseCaseModule {

  FetchProduct provideFetchProduct(ProductRepo productRepo){
    return FetchProductImpl(productRepo: productRepo);
  }

  FetchBanner provideFetchBanner(BannerRepo bannerRepo){
    return FetchBannerImpl(bannerRepo: bannerRepo);
  }

}
@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() {}
