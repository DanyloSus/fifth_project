import 'package:fifth_project/widgets/basket_element.dart';
import 'package:flutter/material.dart';

import '../classes/shop_item.dart';

class BasketSheet extends StatefulWidget {
  const BasketSheet({
    super.key,
    required this.items,
    required this.removeElement,
    required this.pay,
  });

  final List<ShopItem?> items;
  final void Function(ShopItem) removeElement;
  final void Function() pay;

  @override
  State<BasketSheet> createState() => _BasketSheetState();
}

class _BasketSheetState extends State<BasketSheet> {
  void _close() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: _close,
                icon: const Icon(
                  Icons.chevron_left,
                ),
              ),
              const Text(
                "Your Basket",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                width: 32,
              ),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.items.length,
                      itemBuilder: (ctx, index) {
                        return BasketElement(
                          removeElement: widget.removeElement,
                          itemInfo: widget.items[index]!,
                        );
                      }),
                ),
                Container(
                  height: double.infinity,
                  padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "It will cost:",
                      ),
                      Text(
                        "${widget.items.length * 5} gryvnyas",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.green.shade700,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          widget.pay();
                        },
                        child: const Text(
                          "Pay",
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
