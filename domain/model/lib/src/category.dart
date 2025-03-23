import 'package:core/core.dart';

class Category extends Equatable {
  final int id;
  final String title;
  final String image;
  final int? parent;
  final int order;
  final bool isActive;

  const Category({
    required this.id,
    required this.title,
    required this.image,
    this.parent,
    required this.order,
    required this.isActive,
  });

  @override
  List<Object?> get props => [id, title, image, parent, order, isActive];
}
