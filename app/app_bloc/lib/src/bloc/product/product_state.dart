part of 'product_cubit.dart';

class ProductPaginationState extends Equatable {
  const ProductPaginationState({
    this.products = const [],
    this.isLoadingShimmer = false,
    this.isLoadingPagination = false,
    this.error,
    this.errorPagination,
    this.isLast = false,
    this.next
  });

  final List<Product> products;
  final bool isLoadingShimmer;
  final bool isLoadingPagination;
  final String? error;
  final String? errorPagination;
  final bool isLast;
  final String? next;

  ProductPaginationState copyWith({
    List<Product>? products,
    bool? isLoadingShimmer,
    bool? isLoadingPagination,
    String? error,
    String? errorPagination,
    String? next
  }) {
    return ProductPaginationState(
      products: products ?? this.products,
      isLoadingShimmer: isLoadingShimmer ?? false,
      isLoadingPagination: isLoadingPagination ?? false,
      error: error,
      errorPagination: errorPagination,
      next: next
    );
  }

  @override
  List<Object?> get props => [
    products,
    isLoadingShimmer,
    isLoadingPagination,
    error,
    errorPagination,
    next
  ];
}