

import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:network/network.dart';
import 'package:network/src/provider/banner_provider.dart';
import 'package:network/src/provider/impl/banner_provider_impl.dart';
import 'package:network/src/provider/impl/product_provider_impl.dart';

@module
abstract class NetworkProviderModule {

  @lazySingleton
  ProductProvider provideProductProvider(Dio apiClient){
    return ProductProviderImpl(apiClient: apiClient);
  }

  @lazySingleton
  BannerProvider provideBannerProvider(Dio apiClient){
    return BannerProviderImpl(apiClient: apiClient);
  }

}
