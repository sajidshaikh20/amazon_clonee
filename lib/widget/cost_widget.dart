import 'dart:ui';

import 'package:flutter/material.dart';

class CostWiddddddget extends StatelessWidget {
  final Color color;
  final double cost;
  const CostWiddddddget({Key? key, required this.color, required this.cost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: mai,
      children: [
        Text(
          "₹",
          style: TextStyle(
              color: color,
              fontSize: 10,
              fontFeatures: const [FontFeature.superscripts()]),
        ),
        Text(
          cost.toInt().toString(),
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          (cost - cost.toInt()).toStringAsFixed(2),
          style: const TextStyle(
            fontSize: 7,
            fontFeatures: [FontFeature.superscripts()],
          ),
        ),
      ],
    );
  }
}
