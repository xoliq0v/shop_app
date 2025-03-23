part of '../home_page.dart';

class _LoadingView extends StatelessWidget {
  const _LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        delegate: SliverChildBuilderDelegate(
            (context,index){
              return Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.2),
                highlightColor: Colors.white,
                child: Container(
                  margin: const EdgeInsets.all(15),
                  width: double.maxFinite,
                  color: Colors.white,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(15)
                  // ),
                ),
              );
            }
        )
    );
  }
}
