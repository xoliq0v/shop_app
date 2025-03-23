import 'package:model/model.dart';
import 'package:network/network.dart';

extension MarketMapper on MarketDTO {

  Market toMarket(){

    return Market(id: id, title: title, imageSmall: image_small, imageBig: image_big, status: status);

  }

}