import 'package:core/src/network_config/result_mapping.dart';
import 'package:model/src/banner.dart';
import 'package:model/src/base_pagination_response.dart';
import 'package:repository/repository.dart';
import 'package:use_case/src/banner_use_case.dart';

class FetchBannerImpl extends FetchBanner {
  FetchBannerImpl({required this.bannerRepo});

  final BannerRepo bannerRepo;

  @override
  Future<Result<BasePaginatedResponse<Banner>>> fetch(String next) {
    return bannerRepo.fetchBanner(next);
  }

}