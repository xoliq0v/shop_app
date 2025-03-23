import 'package:core/core.dart';
import 'package:repository/src/repository/base_repo.dart';
import 'package:model/model.dart';

abstract class ProductRepo extends BaseRepository {

  Future<Result<BasePaginatedResponse<Product>>> fetchProduct(String next);

}