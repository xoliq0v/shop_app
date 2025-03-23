import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:model/model.dart';
part 'widget/loading.dart';
part 'widget/error.dart';
part 'widget/search.dart';
part 'widget/banner.dart';
part 'widget/product_item.dart';

@RoutePage()
class HomePage extends StatefulWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductCubit>(
              create: (context)=> AppBlocHelper.getProductCubit()
          ),
        ],
        child: this
    );
  }
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(_onPaginated);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _onPaginated() {
    if (!scrollController.isReadyPagination()) return;
    if (!_productCubit.isLoaded) return;
    _productCubit.fetchCategories();
  }

  ProductCubit get _productCubit {
    return context.read<ProductCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            // Search Bar
            const Search(),

            // Banner Slider
            const Banner(),

            // Products Grid - Fixed: Using BlocBuilder directly as a sliver
            BlocBuilder<ProductCubit, ProductPaginationState>(
              builder: (context, state) {
                if (state.isLoadingShimmer) {
                  return const SliverToBoxAdapter(child: _LoadingView());
                } else if (state.error != null) {
                  return const SliverToBoxAdapter(child: ErrorView());
                }

                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        return ProductItem(product: state.products[index]);
                      },
                      childCount: state.products.length,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}