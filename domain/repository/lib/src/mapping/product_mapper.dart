import 'package:model/model.dart';
import 'package:network/network.dart';
import 'package:repository/src/mapping/category_mapper.dart';
import 'package:repository/src/mapping/market_mapper.dart';
import 'package:repository/src/mapping/unit_mapper.dart';

extension ProductMapper on ProductDTO {

  Product toProduct(){
    return Product(
        id: id,
        price: price,
        superPrice: super_price??'0.00',
        superStatus: super_status,
        showStatus: show_status,
        unitValue: unit_value,
        image: image,
        text: text,
        category: category.toCategory(),
        market: market.toMarket(),
        unit: unit.toUnit(),
        images: images
    );
  }
}