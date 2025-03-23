import 'package:core/core.dart';

class Unit extends Equatable {
  final int id;
  final String title;

  const Unit({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [id, title];
}