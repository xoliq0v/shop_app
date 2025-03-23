import 'package:core/core.dart';
part 'market.g.dart';

@JsonSerializable()
class MarketDTO {
  final int id;
  final String title;
  final String image_small;
  final String image_big;
  final bool status;

  MarketDTO({
    required this.id,
    required this.title,
    required this.image_small,
    required this.image_big,
    required this.status,
  });

  factory MarketDTO.fromJson(Map<String, dynamic> json) => _$MarketDTOFromJson(json);
  Map<String, dynamic> toJson() => _$MarketDTOToJson(this);
}