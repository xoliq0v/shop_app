part of '../home_page.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit,ProductPaginationState>(
        builder: (context,state){
          if(state.error != null){
            return Center(
              child: Text(state.error ?? 'Something went wrong!'),
            );
          }
          return const SizedBox.shrink();
        }
    );
  }
}
