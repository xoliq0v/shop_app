// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoryDTO _$SubCategoryDTOFromJson(Map<String, dynamic> json) =>
    SubCategoryDTO(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      image: json['image'] as String?,
      parent: (json['parent'] as num?)?.toInt(),
      order: (json['order'] as num).toInt(),
      is_active: json['is_active'] as bool,
    );

Map<String, dynamic> _$SubCategoryDTOToJson(SubCategoryDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'parent': instance.parent,
      'order': instance.order,
      'is_active': instance.is_active,
    };
