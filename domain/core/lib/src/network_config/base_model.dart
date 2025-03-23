import 'package:core/core.dart';

part 'base_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  ApiResponse(
      this.results, {
        this.success = true,
        this.error,
      });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? data) fromJsonT,
      ) {
    return _$ApiResponseFromJson<T>(json, fromJsonT);
  }

  @JsonKey(name: 'results')
  final T results;

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool success = true;

  @JsonKey(includeFromJson: false, includeToJson: false)
  ApiResponseError? error;
}
