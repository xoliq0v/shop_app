import 'dart:developer';
import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:network/network.dart';

abstract class BaseProvider {

  Future<ApiResponse<T>> apiCall<T>(
      Future<Response> request, {
        required T Function(dynamic data) dataFromJson,
        T? Function(dynamic errorData)? errorDataFromJson,
      }) async {
    try {
      final response = await request;
      final responseData = response.data as Map<String, dynamic>;

      return ApiResponse<T>(
        dataFromJson(
            responseData
        ),
      );
    } on DioException catch (e) {
      log('DioException: ${e.type} - ${e.message}');

      if (e.error is SessionExpiredException) {
        throw SessionExpiredException();
      }

      final errorData = e.response?.data;
      if (errorData != null && errorData is Map<String, dynamic>) {
        try {
          return ApiResponse<T>(
            errorDataFromJson?.call(errorData['results']) as T,
          );
        } catch (err) {
          log('Error parsing error response: $err');
        }
      }

      return ApiResponse<T>(
        null as T,
      );
    } catch (e) {
      log('Unexpected exception: $e');

      return ApiResponse<T>(
        null as T,
      );
    }
  }
}