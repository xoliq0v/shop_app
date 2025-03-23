import 'package:core/core.dart';
import 'package:model/src/base_pagination_response.dart';
import 'package:model/src/product.dart';
import 'package:repository/repository.dart';
import 'package:use_case/src/product_use_case.dart';

@injectable
class FetchProductImpl implements FetchProduct {
  FetchProductImpl({required this.productRepo});

  final ProductRepo productRepo;

  @override
  Future<Result<BasePaginatedResponse<Product>?>> fetchProduct({required String next}) {
    return productRepo.fetchProduct(next);
  }

}