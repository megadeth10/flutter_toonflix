import 'package:flutter/widgets.dart';

class CardItem {
  final String name;
  final int value;
  final String currency;
  final IconData icon;
  final bool isMainBlack;
  final Offset offset;

  CardItem({
    required this.icon,
    required this.isMainBlack,
    required this.offset,
    required this.name,
    required this.value,
    required this.currency,
  });
}
