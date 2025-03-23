import 'package:core/core.dart';

class Banner extends Equatable {
  final int id;
  final String title;
  final String image;
  final bool status;
  final int category;
  final String createdAt;
  final String updatedAt;

  const Banner({
    required this.id,
    required this.title,
    required this.image,
    required this.status,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, title, image, status, category, createdAt, updatedAt];
}