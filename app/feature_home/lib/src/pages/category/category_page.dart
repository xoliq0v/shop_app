import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  List<Map<String, dynamic>> categories = [
    {
      "id": 8,
      "title": "Техника",
      "image": "https://newagroinvitro.uz/sale_media/category/texnika.jpg",
      "parent": null,
      "order": 1,
      "is_active": true
    },
    {
      "id": 10,
      "title": "Продукты",
      "image": "https://newagroinvitro.uz/sale_media/category/produkti.jpg",
      "parent": null,
      "order": 2,
      "is_active": true
    }
  ];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
        itemBuilder: (context,index){
          final item = categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 10),
            child: SizedBox(
              height: 270,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(item['image']),
                      fit: BoxFit.cover
                    ),
                  ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black,
                          Colors.transparent,
                        ],
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0,top: 8),
                    child: Text(
                        item['title'],
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
