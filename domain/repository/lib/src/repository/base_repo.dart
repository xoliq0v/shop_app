import 'dart:async';
import 'dart:developer';

import 'package:core/core.dart';

abstract class BaseRepository {
  Future<Result<DATA>> toResult2<DATA, RESPONSE extends ApiResponse>(
      Future<RESPONSE> future, {
        required FutureOr<DATA> Function(RESPONSE response) fromSuccessResponse,
        FutureOr<Result<DATA>> Function(Result<DATA> result)? switchMap,
      }) async {
    try {
      final response = await future;
      if (response.success) {
        final data = await fromSuccessResponse.call(response);
        final result = Result.completed(data);
        return switchMap?.call(result) ?? result;
      }

      final errorResult = Result<DATA>.error(ResultError(
        reason: response.error?.reason ?? 'Error reason is null',
        message: response.error?.message ?? 'Error message is null',
      ));
      return switchMap?.call(errorResult) ?? errorResult;
    } on SessionExpiredException {
      return Result<DATA>.error(const ResultError(
        message: 'SessionExpiredException caught',
        reason: 'SessionExpired',
      ));
    } on Exception catch (e) {
      log('Exception toResult2 $e');
      final errorResult = Result<DATA>.error(ResultError(
        message: e.toString(),
        reason: 'SomethingWentWrong',
      ));
      return switchMap?.call(errorResult) ?? errorResult;
    } catch (e) {
      log('catch toResult2 $e');
      final errorResult = Result<DATA>.error(ResultError(
        message: e.toString(),
        reason: 'SomethingWentWrong',
      ));
      return switchMap?.call(errorResult) ?? errorResult;
    }
  }
}