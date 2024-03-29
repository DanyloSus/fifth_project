import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../../classes/shop_item.dart';
import '../../data/categories.dart';
import '../../data/shop_items.dart';
import '../shop_element.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.addElement});

  final void Function(ShopItem) addElement;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories.keys.toList()[index];

        return StickyHeader(
          header: Container(
            height: 50.0,
            color: Colors.green.shade700,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              category,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              crossAxisCount: 2,
              children: [
                ...shopItems
                    .where((element) => element.category.name == category)
                    .map(
                      (e) => ShopElement(
                        buyElement: addElement,
                        itemInfo: e,
                      ),
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}
