// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDTO _$ProductDTOFromJson(Map<String, dynamic> json) => ProductDTO(
      id: (json['id'] as num).toInt(),
      price: json['price'] as String,
      sale: json['sale'] as num?,
      super_price: json['super_price'] as String?,
      super_status: json['super_status'] as bool,
      show_status: json['show_status'] as bool,
      unit_value: (json['unit_value'] as num).toInt(),
      image: json['image'] as String,
      text: json['text'] as String,
      category: CategoryDTO.fromJson(json['category'] as Map<String, dynamic>),
      market: MarketDTO.fromJson(json['market'] as Map<String, dynamic>),
      unit: UnitDTO.fromJson(json['unit'] as Map<String, dynamic>),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ProductDTOToJson(ProductDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'sale': instance.sale,
      'super_price': instance.super_price,
      'super_status': instance.super_status,
      'show_status': instance.show_status,
      'unit_value': instance.unit_value,
      'image': instance.image,
      'text': instance.text,
      'category': instance.category,
      'market': instance.market,
      'unit': instance.unit,
      'images': instance.images,
      'url': instance.url,
    };
