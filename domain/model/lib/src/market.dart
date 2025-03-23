import 'package:core/core.dart';

class Market extends Equatable {
  final int id;
  final String title;
  final String imageSmall;
  final String imageBig;
  final bool status;

  const Market({
    required this.id,
    required this.title,
    required this.imageSmall,
    required this.imageBig,
    required this.status,
  });

  @override
  List<Object?> get props => [id, title, imageSmall, imageBig, status];
}