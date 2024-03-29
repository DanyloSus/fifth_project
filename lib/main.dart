import 'package:fifth_project/widgets/pages/main_page.dart';
import 'package:fifth_project/widgets/pages/thanks_page.dart';
import 'package:flutter/material.dart';

import 'classes/shop_item.dart';
import 'widgets/basket_sheet.dart';
import 'widgets/ui/custom_appbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static List<ShopItem?> itemsList = [];
  int index = 0;

  void _removeElement(ShopItem itemList) {
    setState(() {
      itemsList.remove(itemList);
    });
  }

  void _pay() {
    setState(() {
      itemsList = [];
      index = 1;
    });
  }

  void _showBasket(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => BasketSheet(
        items: itemsList,
        removeElement: _removeElement,
        pay: _pay,
      ),
    );
  }

  void _addElement(ShopItem itemList) {
    setState(() {
      itemsList.add(itemList);
    });
  }

  late final List<Widget> _mainWidgets;

  @override
  void initState() {
    super.initState();

    _mainWidgets = [
      MainPage(
        addElement: _addElement,
      ),
      const ThanksPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(
          items: itemsList,
          showBasket: _showBasket,
        ),
        body: _mainWidgets[index],
      ),
    );
  }
}
