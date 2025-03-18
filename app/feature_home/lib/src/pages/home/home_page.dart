import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> bannerImages = [
    'https://images.uzum.uz/cv80cv5pb7f9qcngsumg/main_page_banner.jpg',
    'https://images.uzum.uz/cv0qefrvgbkm5ehhdga0/main_page_banner.jpg',
    'https://images.uzum.uz/cug7q9tht56sc95cis1g/main_page_banner.jpg',
  ];

  final List<Map<String, dynamic>> products = [
    {
      "id": 5,
      "price": "71990.00",
      "sale": 22,
      "super_price": "55990.00",
      "super_status": false,
      "show_status": true,
      "unit_value": 1,
      "image": "https://newagroinvitro.uz/sale_media/product/photo_2025-03-16_12-44-30.jpg",
      "text": "",
      "category": {
        "id": 11,
        "title": "Колбасы и мясные деликатесы",
        "image": "https://newagroinvitro.uz/sale_media/category/kolbasa.png",
        "parent": 10,
        "order": 4,
        "is_active": true
      },
      "market": {
        "id": 4,
        "title": "Makro",
        "image_small": "https://newagroinvitro.uz/sale_media/market/makro.png",
        "image_big": "https://newagroinvitro.uz/sale_media/market/makro_jKk4syB.png",
        "status": true
      },
      "unit": {
        "id": 3,
        "title": "dona"
      },
      "images": []
    },
    {
      "id": 6,
      "price": "19990.00",
      "sale": 25,
      "super_price": null,
      "super_status": false,
      "show_status": true,
      "unit_value": 1,
      "image": "https://newagroinvitro.uz/sale_media/product/photo_2025-03-16_12-44-53.jpg",
      "text": "",
      "category": {
        "id": 10,
        "title": "Продукты",
        "image": "https://newagroinvitro.uz/sale_media/category/produkti.jpg",
        "parent": null,
        "order": 2,
        "is_active": true
      },
      "market": {
        "id": 3,
        "title": "Korzinka",
        "image_small": "https://newagroinvitro.uz/sale_media/market/korzinka.png",
        "image_big": "https://newagroinvitro.uz/sale_media/market/korzinka.jpg",
        "status": true
      },
      "unit": {
        "id": 3,
        "title": "dona"
      },
      "images": []
    },
    {
      "id": 7,
      "price": "45490.00",
      "sale": 21,
      "super_price": null,
      "super_status": false,
      "show_status": true,
      "unit_value": 1,
      "image": "https://newagroinvitro.uz/sale_media/product/photo_2025-03-16_12-43-19.jpg",
      "text": "",
      "category": {
        "id": 10,
        "title": "Продукты",
        "image": "https://newagroinvitro.uz/sale_media/category/produkti.jpg",
        "parent": null,
        "order": 2,
        "is_active": true
      },
      "market": {
        "id": 3,
        "title": "Korzinka",
        "image_small": "https://newagroinvitro.uz/sale_media/market/korzinka.png",
        "image_big": "https://newagroinvitro.uz/sale_media/market/korzinka.jpg",
        "status": true
      },
      "unit": {
        "id": 3,
        "title": "dona"
      },
      "images": []
    },
    {
      "id": 8,
      "price": "14990.00",
      "sale": 26,
      "super_price": null,
      "super_status": false,
      "show_status": true,
      "unit_value": 150,
      "image": "https://newagroinvitro.uz/sale_media/product/1000064620.png",
      "text": "",
      "category": {
        "id": 10,
        "title": "Продукты",
        "image": "https://newagroinvitro.uz/sale_media/category/produkti.jpg",
        "parent": null,
        "order": 2,
        "is_active": true
      },
      "market": {
        "id": 4,
        "title": "Makro",
        "image_small": "https://newagroinvitro.uz/sale_media/market/makro.png",
        "image_big": "https://newagroinvitro.uz/sale_media/market/makro_jKk4syB.png",
        "status": true
      },
      "unit": {
        "id": 2,
        "title": "g"
      },
      "images": []
    },
    {
      "id": 9,
      "price": "92950.00",
      "sale": null,
      "super_price": "92950.00",
      "super_status": true,
      "show_status": true,
      "unit_value": 1,
      "image": "https://newagroinvitro.uz/sale_media/product/3000002017_1.png",
      "text": "",
      "category": {
        "id": 10,
        "title": "Продукты",
        "image": "https://newagroinvitro.uz/sale_media/category/produkti.jpg",
        "parent": null,
        "order": 2,
        "is_active": true
      },
      "market": {
        "id": 4,
        "title": "Makro",
        "image_small": "https://newagroinvitro.uz/sale_media/market/makro.png",
        "image_big": "https://newagroinvitro.uz/sale_media/market/makro_jKk4syB.png",
        "status": true
      },
      "unit": {
        "id": 1,
        "title": "kg"
      },
      "images": []
    },
    {
      "id": 10,
      "price": "24950.00",
      "sale": null,
      "super_price": "24950.00",
      "super_status": true,
      "show_status": true,
      "unit_value": 1,
      "image": "https://newagroinvitro.uz/sale_media/product/1000006710.png",
      "text": "",
      "category": {
        "id": 10,
        "title": "Продукты",
        "image": "https://newagroinvitro.uz/sale_media/category/produkti.jpg",
        "parent": null,
        "order": 2,
        "is_active": true
      },
      "market": {
        "id": 4,
        "title": "Makro",
        "image_small": "https://newagroinvitro.uz/sale_media/market/makro.png",
        "image_big": "https://newagroinvitro.uz/sale_media/market/makro_jKk4syB.png",
        "status": true
      },
      "unit": {
        "id": 4,
        "title": "litr"
      },
      "images": []
    }
  ];

  int _currentBannerIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Search Bar
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey[600]),
                        const SizedBox(width: 8),
                        Text(
                          'Search...',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Banner Slider
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: Column(
                  children: [
                    CarouselSlider(
                      carouselController: _carouselController, // Add controller
                      options: CarouselOptions(
                        height: 150,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 16/9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: const Duration(milliseconds: 800),
                        viewportFraction: 0.9,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentBannerIndex = index;
                          });
                        },
                      ),
                      items: bannerImages.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.amber[200],
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: bannerImages.asMap().entries.map((entry) {
                    //     return Container(
                    //       width: 8.0,
                    //       height: 8.0,
                    //       margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    //       decoration: BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         color: (Theme.of(context).brightness == Brightness.dark
                    //             ? Colors.white
                    //             : Colors.blue)
                    //             .withOpacity(_currentBannerIndex == entry.key ? 0.9 : 0.4),
                    //       ),
                    //     );
                    //   }).toList(),
                    // ),
                  ],
                ),
              ),
            ),

            // Section Title - FIXED: Now wrapped in SliverToBoxAdapter
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Featured Products',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('See All'),
                    ),
                  ],
                ),
              ),
            ),

            // Products Grid
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.5, // Adjusted to allow more space for content
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  final bool isSuperPrice = product['super_status'] ?? false;
                  final hasSale = product['sale'] != null;
                  final String formattedPrice = '${(double.parse(product['price']) / 1000).toStringAsFixed(0)} 000';
                  final String formattedSuperPrice = product['super_price'] != null
                      ? '${(double.parse(product['super_price']) / 1000).toStringAsFixed(0)} 000'
                      : '';

                  return Card(
                    elevation: 1,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Image
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: product['image'],
                                height: 265,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  height: 160,
                                  width: double.infinity,
                                  color: Colors.grey[200],
                                  child: Center(
                                    child: Icon(
                                      Icons.image,
                                      size: 50,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  height: 160,
                                  width: double.infinity,
                                  color: Colors.grey[200],
                                  child: Center(
                                    child: Icon(
                                      Icons.error,
                                      size: 50,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // Market Logo at top left
                            Positioned(
                              top: 8,
                              left: 8,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: product['market']['image_small'],
                                  height: 24,
                                  width: 24,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    height: 24,
                                    width: 24,
                                    color: Colors.grey[200],
                                  ),
                                  errorWidget: (context, url, error) => Container(
                                    height: 24,
                                    width: 24,
                                    color: Colors.grey[200],
                                    child: const Icon(Icons.business, size: 16),
                                  ),
                                ),
                              ),
                            ),

                            // Like Button at top right
                            Positioned(
                              top: 8,
                              right: 8,
                              child: GestureDetector(
                                onTap: () {
                                  // Add like functionality here
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.favorite_border,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),

                            // Sale Badge
                            if (hasSale)
                              Positioned(
                                bottom: 8,
                                left: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    '-${product['sale']}%',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),

                        // Product Details
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Product Category and Super Price
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Super Price Label if applicable
                                    if (isSuperPrice)
                                      Container(
                                        margin: const EdgeInsets.only(bottom: 4),
                                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: const Text(
                                          'Super narx',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),

                                    Text(
                                      product['category']['title'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),

                                // Unit information
                                Text(
                                  '${product['unit_value']} ${product['unit']['title']}',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey[700],
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                // Price information
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          isSuperPrice ? formattedSuperPrice : formattedPrice,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: isSuperPrice ? Colors.orange : Colors.blue,
                                          ),
                                        ),
                                        // Add to cart button could be added here
                                      ],
                                    ),
                                    if (hasSale && !isSuperPrice)
                                      Text(
                                        formattedPrice,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                      ),
                                  ],
                                ),

                                // Market name
                                Text(
                                  product['market']['title'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

