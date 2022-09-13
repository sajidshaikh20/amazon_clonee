import 'package:amazon_clonee/model/product_model.dart';
import 'package:amazon_clonee/utils/colors_themes.dart';
import 'package:amazon_clonee/utils/utils.dart';
import 'package:amazon_clonee/widget/custom_square_botton.dart';
import 'package:amazon_clonee/widget/custon_simple_rounded_button.dart';
import 'package:amazon_clonee/widget/product_indormation.dart';
import 'package:flutter/material.dart';

class CartItemsWidget extends StatelessWidget {
  final ProductModel product;
  const CartItemsWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screeSize = Utils().getScreenSize();
    return Container(
      padding: const EdgeInsets.all(18),
      height: screeSize.height / 2,
      width: screeSize.width,
      decoration: const BoxDecoration(
          color: backgroundColor,
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: screeSize.width / 3,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Center(
                      child: Image.network(product.url),
                    ),
                  ),
                ),
                ProductInformationWidget(
                    productName: product.productName,
                    cost: product.cost,
                    seller: product.sellerName)
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                CustomSquareButton(
                    onPressed: () {},
                    color: backgroundColor,
                    dimension: 40,
                    child: const Icon(Icons.remove)),
                CustomSquareButton(
                    onPressed: () {},
                    color: Colors.white,
                    dimension: 40,
                    child: const Text(
                      "0",
                      style: TextStyle(color: activeCyancolor),
                    )),
                CustomSquareButton(
                    onPressed: () {},
                    color: backgroundColor,
                    dimension: 40,
                    child: const Icon(Icons.add)),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        CustonSimpleButton(onPressed: () {}, text: "Delete"),
                        const SizedBox(
                          width: 5,
                        ),
                        CustonSimpleButton(
                            onPressed: () {}, text: "Save for later"),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          " see more of this",
                          style: TextStyle(color: activeCyancolor),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
