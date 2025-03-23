import 'package:core/core.dart';
import 'package:model/model.dart';

abstract class FetchBanner{

  Future<Result<BasePaginatedResponse<Banner>>> fetch(String next);

}