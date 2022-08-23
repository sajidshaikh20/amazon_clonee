import 'package:amazon_clonee/utils/utils.dart';
import 'package:flutter/material.dart';

class ProductInformationWidget extends StatelessWidget {
  final String productName;
  final int cost;
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
    return SizedBox(
      width: screenSize.width / 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            productName,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                overflow: TextOverflow.ellipsis),
          )
        ],
      ),
    );
  }
}
