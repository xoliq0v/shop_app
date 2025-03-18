import 'dart:async';

import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';

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


}
@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() {}
