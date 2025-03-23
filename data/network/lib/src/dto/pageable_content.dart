import 'package:core/core.dart' hide Map;

part 'pageable_content.g.dart';

// Update your PageableContentDTO class to properly define the generic parameter
@JsonSerializable(genericArgumentFactories: true)
class PageableContentDTO<T> {
  PageableContentDTO({
    required this.results,
    required this.count,
    this.next,
    this.previous,
  });

  factory PageableContentDTO.fromJson(
      Map<String, dynamic> json,
      T Function(Object?) fromJsonT
      ) => _$PageableContentDTOFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$PageableContentDTOToJson(this, toJsonT);

  @Default([]) final List<T> results;
  @Default(0) final int count;
  final String? next;
  final String? previous;
}