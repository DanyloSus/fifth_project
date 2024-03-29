import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

import '../../classes/shop_item.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.items,
    required this.showBasket,
  });

  final List<ShopItem?> items;
  final void Function(BuildContext) showBasket;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green.shade500,
      title: OctoImage(
        image: const AssetImage("assets/logo.png"),
        height: 50,
        progressIndicatorBuilder: (context, progress) {
          double? value;
          var expectedBytes = progress?.expectedTotalBytes;
          if (progress != null && expectedBytes != null) {
            value = progress.cumulativeBytesLoaded / expectedBytes;
          }
          return CircularProgressIndicator(value: value);
        },
        errorBuilder: (context, error, stacktrace) => const Icon(Icons.error),
      ),
      actions: [
        IconButton(
          onPressed: () {
            showBasket(context);
          },
          icon: Badge(
            label: Text(
              items.length.toString(),
            ),
            isLabelVisible: items.isNotEmpty,
            child: Icon(
              Icons.shopping_basket,
              color: Colors.green.shade900,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
