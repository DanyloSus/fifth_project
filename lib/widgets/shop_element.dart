import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import '../classes/shop_item.dart';

class ShopElement extends StatefulWidget {
  const ShopElement(
      {super.key, required this.buyElement, required this.itemInfo});

  final void Function(ShopItem) buyElement;
  final ShopItem itemInfo;

  @override
  State<ShopElement> createState() => _ShopElementState();
}

class _ShopElementState extends State<ShopElement> {
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
                widget.itemInfo.image,
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
                  widget.itemInfo.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  widget.itemInfo.description,
                ),
              ],
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.green.shade700,
              ),
              onPressed: () {
                widget.buyElement(widget.itemInfo);
              },
              child: const Text(
                "Buy",
              ),
            )
          ],
        ),
      ),
    );
  }
}
