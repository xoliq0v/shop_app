import 'package:core/core.dart';

class BasePaginatedResponse<T> extends Equatable {
  const BasePaginatedResponse({
    required this.result,
    required this.pagination,
  });

  final List<T> result;
  final BasePaginationResponseData pagination;

  @override
  List<Object?> get props => [
    result,
    pagination,
  ];
}

class BasePaginationResponseData extends Equatable {
  const BasePaginationResponseData({
    required this.next,
    required this.previous,
    required this.count,
  });

  final String? next;
  final String? previous;
  final int count;

  @override
  List<Object?> get props => [next,previous,count];
}