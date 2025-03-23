// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerDTO _$BannerDTOFromJson(Map<String, dynamic> json) => BannerDTO(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      image: json['image'] as String,
      status: json['status'] as bool,
      category: (json['category'] as num).toInt(),
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$BannerDTOToJson(BannerDTO instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'status': instance.status,
      'category': instance.category,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
