import '../../core.dart' hide Map;

part 'pagination_model.g.dart';

@JsonSerializable()
class Pagination {
  Pagination({
    required this.total,
    required this.currentPage,
    required this.perPage,
    required this.lastPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  @JsonKey(name: 'total')
  final int total;

  @JsonKey(name: 'current_page')
  final int currentPage;

  @JsonKey(name: 'per_page')
  final int perPage;

  @JsonKey(name: 'last_page')
  final int lastPage;

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}