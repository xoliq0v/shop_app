import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:repository/src/repository/base_repo.dart';

abstract class BannerRepo extends BaseRepository {

  Future<Result<BasePaginatedResponse<Banner>>> fetchBanner(String next);

}