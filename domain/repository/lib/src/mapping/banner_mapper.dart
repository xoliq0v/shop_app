import 'package:model/model.dart';
import 'package:network/network.dart';

extension BannerMapper on BannerDTO {

  Banner toBanner(){
    return Banner(id: id, title: title, image: image, status: status, category: category, createdAt: created_at, updatedAt: updated_at);
  }

}