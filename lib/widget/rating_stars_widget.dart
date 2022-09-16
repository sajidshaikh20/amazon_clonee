import 'package:flutter/material.dart';

class RatingStarwidget extends StatelessWidget {
  final int rating;
  const RatingStarwidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    List<Widget> childern = [];

    for (int i = 0; i < 5; i++) {
      childern.add(i < rating
          ? const Icon(
              Icons.star,
              color: Colors.orange,
            )
          : const Icon(
              Icons.star_border,
              color: Colors.orange,
            ));
    }

    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: childern,
    );
  }
}
