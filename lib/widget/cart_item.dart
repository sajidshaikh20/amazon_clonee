import 'package:amazon_clonee/utils/colors_themes.dart';
import 'package:amazon_clonee/utils/utils.dart';
import 'package:amazon_clonee/widget/custom_square_botton.dart';
import 'package:amazon_clonee/widget/product_indormation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CartItemsWidget extends StatelessWidget {
  const CartItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screeSize = Utils().getScreenSize();
    return Container(
      height: screeSize.height / 2,
      width: screeSize.width,
      decoration: const BoxDecoration(
          color: backgroundColor,
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: screeSize.width / 3,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.network(
                        "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
                  ),
                ),
                const ProductInformationWidget(
                    productName:
                        "something something cleans stuff pink in color",
                    cost: 1000.3,
                    seller: "sajid")
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                CustomSquareButton(
                    onPressed: () {},
                    color: Colors.grey[500]!,
                    dimension: 50,
                    child: const Icon(Icons.remove)),
                CustomSquareButton(
                    onPressed: () {},
                    color: Colors.grey[200]!,
                    dimension: 50,
                    child: const Text("0")),
                CustomSquareButton(
                    onPressed: () {},
                    color: Colors.grey[500]!,
                    dimension: 50,
                    child: const Icon(Icons.add)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
