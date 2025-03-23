import 'package:app_bloc/app_bloc.dart';
import 'package:app_bloc/src/bloc/banner/banner_bloc.dart';
import 'package:core/core.dart';

mixin AppBlocHelper {

  static InternetConnectivityController getInternetConnectivityController() {
    return GetIt.I.get<InternetConnectivityController>();
  }

  static ProductCubit getProductCubit(){
    return GetIt.I.get<ProductCubit>();
  }

  static BannerCubit getBannerCubit(){
    return GetIt.I.get<BannerCubit>();
  }

}