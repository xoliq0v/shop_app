// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseError _$ApiResponseErrorFromJson(Map<String, dynamic> json) =>
    ApiResponseError(
      message: json['message'] as String,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$ApiResponseErrorToJson(ApiResponseError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'reason': instance.reason,
    };
