part of '../home_page.dart';

class _LoadingView extends StatelessWidget {
  const _LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerView(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
              return const SizedBox(
                width: double.maxFinite,
                height: 70,
              );
            }
        )
    );
  }
}
