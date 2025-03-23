part of 'banner_bloc.dart';

class BannerState extends Equatable {
  const BannerState({
    this.banners = const [],
    this.isLoading = true,
    this.isLoadingPagination = false,
    this.error,
    this.errorPagination,
    this.isLast = false,
    this.next
  });

  final List<Banner> banners;
  final bool isLoading;
  final bool isLoadingPagination;
  final String? error;
  final String? errorPagination;
  final bool isLast;
  final String? next;

  BannerState copyWith({
    List<Banner>? banners,
    bool? isLoading,
    bool? isLoadingPagination,
    String? error,
    String? errorPagination,
    String? next
  }) {
    return BannerState(
        banners: banners ?? this.banners,
        isLoading: isLoading ?? true,
        isLoadingPagination: isLoadingPagination ?? false,
        error: error,
        errorPagination: errorPagination,
        next: next
    );
  }

  @override
  List<Object?> get props => [
    banners,
    isLoading,
    isLoadingPagination,
    error,
    errorPagination,
    next
  ];
}