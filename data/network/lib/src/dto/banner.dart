import 'package:core/core.dart';
part 'banner.g.dart';

@JsonSerializable()
class BannerDTO {
  final int id;
  final String title;
  final String image;
  final bool status;
  final int category;
  final String created_at;
  final String updated_at;

  BannerDTO({
    required this.id,
    required this.title,
    required this.image,
    required this.status,
    required this.category,
    required this.created_at,
    required this.updated_at,
  });

  factory BannerDTO.fromJson(Map<String, dynamic> json) => _$BannerDTOFromJson(json);
  Map<String, dynamic> toJson() => _$BannerDTOToJson(this);
}