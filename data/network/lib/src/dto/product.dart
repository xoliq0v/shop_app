import 'package:core/core.dart';
import 'package:network/network.dart';
part 'product.g.dart';

@JsonSerializable()
class ProductDTO {
  final int id;
  final String price;
  final num? sale;
  final String? super_price;
  final bool super_status;
  final bool show_status;
  final int unit_value;
  final String image;
  final String text;
  final CategoryDTO category;
  final MarketDTO market;
  final UnitDTO unit;
  final List<String> images;
  final String? url;

  ProductDTO({
    required this.id,
    required this.price,
    this.sale,
    this.super_price,  // Changed to nullable
    required this.super_status,
    required this.show_status,
    required this.unit_value,
    required this.image,
    required this.text,
    required this.category,
    required this.market,
    required this.unit,
    required this.images,
    this.url,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) => _$ProductDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDTOToJson(this);
}