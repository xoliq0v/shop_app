import 'package:core/core.dart';
import 'package:model/model.dart';

// Product Model
class Product extends Equatable {
  final int id;
  final String price;
  final String? sale;
  final String superPrice;
  final bool superStatus;
  final bool showStatus;
  final int unitValue;
  final String image;
  final String text;
  final Category category;
  final Market market;
  final Unit unit;
  final List<String> images;

  const Product({
    required this.id,
    required this.price,
    this.sale,
    required this.superPrice,
    required this.superStatus,
    required this.showStatus,
    required this.unitValue,
    required this.image,
    required this.text,
    required this.category,
    required this.market,
    required this.unit,
    required this.images,
  });

  @override
  List<Object?> get props => [
    id,
    price,
    sale,
    superPrice,
    superStatus,
    showStatus,
    unitValue,
    image,
    text,
    category,
    market,
    unit,
    images,
  ];
}