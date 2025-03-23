import 'dart:async';

import 'package:app_bloc/app_bloc.dart';
import 'package:app_bloc/src/bloc/banner/banner_bloc.dart';
import 'package:core/core.dart';
import 'package:use_case/use_case.dart';

@module
abstract class AppBlocModule {


  InternetConnectivityController provideInternetConnectivityController(
      Connectivity connectivity,
      InternetConnectionChecker internetConnectionChecker,
      ) {
    return InternetConnectivityController(
      connectivity,
      internetConnectionChecker,
    );
  }

  ProductCubit provideProductCubit(
      FetchProduct fetchProduct
      ){
    return ProductCubit(
        fetchProduct,
    );
  }

  BannerCubit provideBannerCubit(
      FetchBanner fetchBanner
      ){
    return BannerCubit(
      fetchBanner,
    );
  }


}
@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() {}
