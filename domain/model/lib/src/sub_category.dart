import 'package:core/core.dart';

class SubCategory extends Equatable {
  final int id;
  final String title;
  final String? image;
  final int? parent;
  final int order;
  final bool isActive;

  const SubCategory({
    required this.id,
    required this.title,
    this.image,
    this.parent,
    required this.order,
    required this.isActive,
  });

  @override
  List<Object?> get props => [id, title, image, parent, order, isActive];
}