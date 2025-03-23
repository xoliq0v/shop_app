import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:network/src/provider/base_provider.dart';

abstract class ProductProvider extends BaseProvider {

  Future<ApiResponse<PageableContentDTO<ProductDTO>>> fetchProduct(String next);

}