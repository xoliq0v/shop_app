// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageableContentDTO<T> _$PageableContentDTOFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PageableContentDTO<T>(
      results: (json['results'] as List<dynamic>).map(fromJsonT).toList(),
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
    );

Map<String, dynamic> _$PageableContentDTOToJson<T>(
  PageableContentDTO<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'results': instance.results.map(toJsonT).toList(),
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
    };
