import 'package:amazon_clonee/utils/colors_themes.dart';
import 'package:amazon_clonee/utils/utils.dart';
import 'package:amazon_clonee/widget/cost_widget.dart';
import 'package:flutter/material.dart';

class ProductInformationWidget extends StatelessWidget {
  final String productName;
  final double cost;
  final String seller;

  const ProductInformationWidget(
      {Key? key,
      required this.productName,
      required this.cost,
      required this.seller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    SizedBox spacething = const SizedBox(
      height: 5,
    );
    return SizedBox(
      width: screenSize.width / 2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              productName,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.5,
                  letterSpacing: 0.9,
                  overflow: TextOverflow.visible),
            ),
          ),
          spacething,
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: CostWiddddddget(color: Colors.black, cost: cost),
            ),
          ),
          spacething,
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Sold by ",
                  style: TextStyle(color: Colors.grey[700], fontSize: 14)),
              TextSpan(
                  text: seller,
                  style: const TextStyle(color: activeCyancolor, fontSize: 14))
            ])),
          )
        ],
      ),
    );
  }
}
