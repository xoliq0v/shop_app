import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';

mixin AppBlocHelper {

  static InternetConnectivityController getInternetConnectivityController() {
    return GetIt.I.get<InternetConnectivityController>();
  }

}