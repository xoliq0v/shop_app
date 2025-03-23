import 'package:core/core.dart';
part 'category.g.dart';

@JsonSerializable()
class CategoryDTO {
  final int id;
  final String title;
  final String image;
  final int? parent;
  final int order;
  final bool is_active;

  CategoryDTO({
    required this.id,
    required this.title,
    required this.image,
    this.parent,
    required this.order,
    required this.is_active,
  });

  factory CategoryDTO.fromJson(Map<String, dynamic> json) => _$CategoryDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryDTOToJson(this);
}