import 'package:model/model.dart';
import 'package:network/network.dart';

extension PageableContentDTOExt<T> on PageableContentDTO<T> {
  BasePaginatedResponse<T> toBasePaginatedResponse<T>({
    required T Function(dynamic json) contentMapper,
  }) {
    return BasePaginatedResponse<T>(
      result: results.map((json) => contentMapper.call(json)).toList(),
      pagination: BasePaginationResponseData(
        next: next,
        previous: previous,
        count: count
      )
    );
  }
}