import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

import '../mixin/pagination.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductPaginationState>
    with PaginationCubitWrapper {
  ProductCubit(
      this._fetchProduct) : super(const ProductPaginationState()) {
    // localInitialPageSize = initialPageSize;
    fetchCategories();
  }

  final FetchProduct _fetchProduct;
  bool isFirst = true;

  Future<bool?> fetchCategories() async {
    if (isLastPage || state.isLoadingPagination || state.isLoadingShimmer) {
      return null;
    }
    if (!isLoaded) emit(state.copyWith(isLoadingShimmer: true));
    if (isLoaded && state.products.isNotEmpty) {
      emit(state.copyWith(isLoadingPagination: true));
    }
    return _fetch();
  }

  Future<bool?> refresh() async {
    if (state.isLoadingPagination || state.isLoadingShimmer) {
      return null;
    }
    localCurrentPage = 0;
    return _fetch(isRefresh: true);
  }

  Future<bool> _fetch({
    bool isRefresh = false,
  }) async {
    final res = await _fetchProduct.fetchProduct(
        next: state.next ?? 'https://sale.newagroinvitro.uz/api/v1/products/'
    );

    switch (res.status) {
      case Status.completed:
        final products = res.data?.result ?? []; // Changed from result to results
        isLastPage = products.isEmpty || res.data?.pagination.next == null;
        isLoaded = true;

        emit(state.copyWith(
            products: isRefresh ? products : [...state.products, ...products],
            isLoadingShimmer: false,
            isLoadingPagination: false,
            next: res.data?.pagination.next, // Update the next page URL
            error: null, // Clear any previous errors
            errorPagination: null
        ));

        return true;
      case Status.error:
        if (state.isLoadingPagination) {
          emit(state.copyWith(
              isLoadingPagination: false,
              errorPagination: res.error?.message ?? ''
          ));
        } else {
          emit(state.copyWith(
              isLoadingShimmer: false,
              error: res.error?.message ?? ''
          ));
        }
        return false;
    }
  }
}