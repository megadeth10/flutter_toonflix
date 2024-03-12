import 'package:flutter/material.dart';
import 'package:toonflix/item/card_item.dart';
import 'package:toonflix/util/util.dart';

class NameCard extends StatelessWidget {
  final CardItem item;

  const NameCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = item.isMainBlack ? Colors.grey : Colors.white;
    Color textColor = item.isMainBlack ? Colors.white : Colors.black;
    return Transform.translate(
      offset: item.offset,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        Util.getCurrencyDisplayText(item.value),
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        item.currency,
                        style: TextStyle(
                          color: textColor.withOpacity(0.8),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Transform.scale(
                scale: 5,
                child: Transform.translate(
                  offset: const Offset(-4, 5),
                  child: Icon(
                    item.icon,
                    color: textColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
