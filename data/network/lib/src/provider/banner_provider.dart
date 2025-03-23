import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:network/src/dto/banner.dart';
import 'package:network/src/provider/base_provider.dart';

abstract class BannerProvider extends BaseProvider{

  Future<ApiResponse<PageableContentDTO<BannerDTO>>> fetchBanner(String next);

}