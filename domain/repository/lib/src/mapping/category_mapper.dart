import 'package:model/model.dart';
import 'package:network/network.dart';

extension CategoryMapper on CategoryDTO {

  Category toCategory(){
    return Category(id: id, title: title, image: image, order: order, isActive: is_active);
  }

}