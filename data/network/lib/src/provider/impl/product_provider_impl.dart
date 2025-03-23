import 'dart:developer';

import 'package:core/src/network_config/base_model.dart';
import 'package:dio/dio.dart';
import 'package:network/network.dart';

class ProductProviderImpl extends ProductProvider {
  ProductProviderImpl({required this.apiClient});

  final Dio apiClient;

  @override
  Future<ApiResponse<PageableContentDTO<ProductDTO>>> fetchProduct(String next) {
    return apiCall(
      apiClient.get(next),
      dataFromJson: (data) {
        // log('DATA_DATA: ${data}');
        try {
          return PageableContentDTO.fromJson(data, (item)=> ProductDTO.fromJson(item as Map<String,dynamic>));
        } catch (e) {
          log('Error parsing product data: $e');
          rethrow;
        }
      },
    );
  }


}