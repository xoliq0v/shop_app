import 'dart:async';

import 'package:core/core.dart' hide Duration;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:network/src/interceptor/basic_auth.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {

  @lazySingleton
  BasicAuthInterceptor provideAuthInterceptor(){
    return BasicAuthInterceptor('admin', '9798');
  }

  @lazySingleton
  Dio provideDio(
      BaseOptions baseOptions,
      BasicAuthInterceptor auth
      ) {
    final dio = Dio(baseOptions);
    return dio
      ..interceptors.addAll(
        [
          auth,
          if (!kReleaseMode)
            PrettyDioLogger(requestHeader: true, requestBody: true),
        ],
      );
  }

  @lazySingleton
  @Named('auth_dio')
  Dio provideAuthDio(
      BaseOptions baseOptions,
      BasicAuthInterceptor auth
      ) {
    final dio = Dio(baseOptions);
    return dio
      ..interceptors.addAll(
        [
          auth,
          if (!kReleaseMode)
            PrettyDioLogger(requestHeader: true, requestBody: true),
        ],
      );
  }

  BaseOptions provideBaseOptions(@Named('base_url') String baseUrl) {
    return BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
  }

}

@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() {}