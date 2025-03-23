import 'package:core/src/network_config/result_mapping.dart';
import 'package:model/src/base_pagination_response.dart';
import 'package:model/src/product.dart';
import 'package:network/network.dart';
import 'package:repository/src/mapping/pageable_content_mapping.dart';
import 'package:repository/src/mapping/product_mapper.dart';
import 'package:repository/src/repository/product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  ProductRepoImpl({required this.productProvider});

  final ProductProvider productProvider;

  @override
  Future<Result<BasePaginatedResponse<Product>>> fetchProduct(String next) {
    return toResult2(
        productProvider.fetchProduct(next),
        fromSuccessResponse: (data){
          return data.results.toBasePaginatedResponse(
            contentMapper: (json){
              return (json as ProductDTO).toProduct();
            }
          );
        }
    );
  }



}