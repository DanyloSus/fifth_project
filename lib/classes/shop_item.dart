import 'package:fifth_project/classes/category.dart';

class ShopItem {
  ShopItem({
    required this.description,
    required this.image,
    required this.name,
    required this.price,
    required this.category,
  });

  final double price;
  final String description;
  final String name;
  final String image;
  final Category category;
}
