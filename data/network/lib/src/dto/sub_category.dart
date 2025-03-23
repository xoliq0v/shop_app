import 'package:core/core.dart';
part 'sub_category.g.dart';

@JsonSerializable()
class SubCategoryDTO {
  final int id;
  final String title;
  final String? image;
  final int? parent;
  final int order;
  final bool is_active;

  SubCategoryDTO({
    required this.id,
    required this.title,
    this.image,
    this.parent,
    required this.order,
    required this.is_active,
  });

  factory SubCategoryDTO.fromJson(Map<String, dynamic> json) => _$SubCategoryDTOFromJson(json);
  Map<String, dynamic> toJson() => _$SubCategoryDTOToJson(this);
}