import 'package:core/core.dart';
part 'unit.g.dart';

@JsonSerializable()
class UnitDTO {
  final int id;
  final String title;

  UnitDTO({
    required this.id,
    required this.title,
  });

  factory UnitDTO.fromJson(Map<String, dynamic> json) => _$UnitDTOFromJson(json);
  Map<String, dynamic> toJson() => _$UnitDTOToJson(this);
}
