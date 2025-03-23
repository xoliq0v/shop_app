import 'package:model/model.dart';
import 'package:network/network.dart';

extension UnitMapper on UnitDTO {

  Unit toUnit(){

    return Unit(id: id, title: title);

  }

}