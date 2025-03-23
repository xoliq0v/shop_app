mixin PaginationCubitWrapper {
  int localCurrentPage = 0;
  late final int localInitialPageSize;

  int get localPageSize {
    return isLoaded ? 10 : localInitialPageSize;
  }

  bool isLoaded = false;
  bool isLastPage = false;
}