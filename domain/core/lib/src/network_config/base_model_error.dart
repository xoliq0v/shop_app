import 'package:json_annotation/json_annotation.dart' show JsonSerializable;

part 'base_model_error.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponseError {
  ApiResponseError({
    required this.message,
    required this.reason,
  });

  factory ApiResponseError.fromJson(Map<String, dynamic> json) {
    return _$ApiResponseErrorFromJson(json);
  }

  final String message;
  final String reason;
}