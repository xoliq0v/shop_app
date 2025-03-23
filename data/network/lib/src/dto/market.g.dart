// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketDTO _$MarketDTOFromJson(Map<String, dynamic> json) => MarketDTO(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      image_small: json['image_small'] as String,
      image_big: json['image_big'] as String,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$MarketDTOToJson(MarketDTO instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image_small': instance.image_small,
      'image_big': instance.image_big,
      'status': instance.status,
    };
