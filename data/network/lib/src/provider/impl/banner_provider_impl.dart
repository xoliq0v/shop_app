import 'package:core/src/network_config/base_model.dart';
import 'package:dio/dio.dart';
import 'package:network/src/dto/banner.dart';
import 'package:network/src/dto/pageable_content.dart';
import 'package:network/src/provider/banner_provider.dart';

class BannerProviderImpl extends BannerProvider {
  BannerProviderImpl({required this.apiClient});

  final Dio apiClient;

  @override
  Future<ApiResponse<PageableContentDTO<BannerDTO>>> fetchBanner(String next) {
    return apiCall(
        apiClient.get(next),
        dataFromJson: (item){
          return PageableContentDTO.fromJson(item, (data)=> BannerDTO.fromJson(data as Map<String, dynamic>));
        }
    );
  }



}