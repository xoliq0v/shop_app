import 'package:core/src/network_config/result_mapping.dart';
import 'package:model/src/banner.dart';
import 'package:model/src/base_pagination_response.dart';
import 'package:network/network.dart';
import 'package:repository/src/mapping/banner_mapper.dart';
import 'package:repository/src/mapping/pageable_content_mapping.dart';
import 'package:repository/src/repository/banner_repo.dart';

class BannerRepoImpl extends BannerRepo {
  BannerRepoImpl({required this.bannerProvider});

  final BannerProvider bannerProvider;

  @override
  Future<Result<BasePaginatedResponse<Banner>>> fetchBanner(String next) {
    return toResult2(
        bannerProvider.fetchBanner(next),
        fromSuccessResponse: (data){
          return data.results.toBasePaginatedResponse(
            contentMapper: (item){
              return (item as BannerDTO).toBanner();
            }
          );
        }
    );
  }



}