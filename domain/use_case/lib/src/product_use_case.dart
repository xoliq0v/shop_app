import 'package:core/core.dart';
import 'package:model/model.dart';

abstract class FetchProduct{

  Future<Result<BasePaginatedResponse<Product>?>> fetchProduct({
    required String next,
  });

}