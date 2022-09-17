import 'package:amazon_clonee/model/product_model.dart';
import 'package:amazon_clonee/model/user_details.dart';
import 'package:amazon_clonee/utils/colors_themes.dart';
import 'package:amazon_clonee/utils/constant.dart';
import 'package:amazon_clonee/widget/cart_item.dart';
import 'package:amazon_clonee/widget/custom_main_botton.dart';
import 'package:amazon_clonee/widget/search_bar_widget.dart';
import 'package:amazon_clonee/widget/user_details_bar.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        hasBackBotton: false,
        isReadOnly: true,
      ),
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: kAppBarHeight / 2,
                ),
                // ignore: sort_child_properties_last
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomMainBotton(
                      // ignore: sort_child_properties_last
                      child: const Text(
                        "Proceed to by (n) items",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        // maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      color: yellowColor,
                      isLoading: false,
                      onPressed: () {}),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return CartItemsWidget(
                          product: ProductModel(
                              url:
                                  "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
                              productName: "sajid_bhuru",
                              cost: 9744646,
                              discount: 0,
                              uid: "sachin",
                              sellerName: "kavita",
                              sellerUid: "15ca16",
                              rating: 3,
                              noOfRating: 5),
                        );
                      }),
                )
              ],
            ),
            UserDetailsBar(
                offset: 0,
                userdetails: UserDetailsModel(name: "sajid", address: "dewas")),
          ],
        ),
      ),
    );
  }
}
