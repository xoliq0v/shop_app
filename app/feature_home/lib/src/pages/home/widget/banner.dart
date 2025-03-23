part of '../home_page.dart';

class Banner extends StatelessWidget {
  const Banner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerCubit,BannerState>(
      builder: (context,state) {

        if (state.isLoading) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
              width: double.infinity,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.2),
                highlightColor: Colors.white,
                child: Container(
                  margin: const EdgeInsets.all(15),
                  width: double.maxFinite,
                  height: 200,
                  color: Colors.white,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(15)
                  // ),
                ),
              ),
            ),
          );
        }

        if(state.error != null){
          return SizedBox(
            width: double.maxFinite,
            height: 150,
            child: Center(
              child: Text(state.error!),
            ),
          );
        }

        if(!state.isLoading) {
          return SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 180,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16/9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    viewportFraction: 0.9,
                  ),
                  items: state.banners.map((banner) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.amber[200],
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(banner.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        );
        }
        return const Text('DATA');
      }
    );
  }
}
