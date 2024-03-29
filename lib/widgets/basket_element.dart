import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

import '../classes/shop_item.dart';

class BasketElement extends StatelessWidget {
  const BasketElement(
      {super.key, required this.removeElement, required this.itemInfo});

  final void Function(ShopItem) removeElement;
  final ShopItem itemInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OctoImage(
              image: NetworkImage(
                itemInfo.image,
              ),
              height: 100,
              fit: BoxFit.contain,
              progressIndicatorBuilder: (context, progress) {
                double? value;
                var expectedBytes = progress?.expectedTotalBytes;
                if (progress != null && expectedBytes != null) {
                  value = progress.cumulativeBytesLoaded / expectedBytes;
                }
                return CircularProgressIndicator(value: value);
              },
              errorBuilder: (context, error, stacktrace) =>
                  const Icon(Icons.error),
            ),
            Column(
              children: [
                Text(
                  itemInfo.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  itemInfo.description,
                ),
              ],
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.green.shade700,
              ),
              onPressed: () {
                removeElement(itemInfo);
              },
              child: const Text(
                "Remove",
              ),
            )
          ],
        ),
      ),
    );
  }
}
