import 'dart:convert';

import 'package:dio/dio.dart';

class BasicAuthInterceptor extends Interceptor {
  final String username;
  final String password;

  BasicAuthInterceptor(this.username, this.password);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) {
    final basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    options.headers['Authorization'] = basicAuth;
    super.onRequest(options, handler);
  }
}