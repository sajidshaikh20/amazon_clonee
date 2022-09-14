import 'package:amazon_clonee/model/product_model.dart';
import 'package:amazon_clonee/utils/utils.dart';
import 'package:amazon_clonee/widget/cost_widget.dart';
import 'package:amazon_clonee/widget/rating_stars_widget.dart';
import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final ProductModel product;
  const ResultWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Column(
      children: [
        SizedBox(
          width: screenSize.width / 3,
          child: Image.network(product.url),
        ),
        Text(product.productName),
        RatingStarwidget(rating: product.rating),
        CostWiddddddget(
            color: const Color.fromARGB(255, 92, 9, 3), cost: product.cost),
      ],
    );
  }
}
