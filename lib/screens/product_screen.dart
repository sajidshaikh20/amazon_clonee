import 'package:amazon_clonee/model/product_model.dart';
import 'package:amazon_clonee/model/user_details.dart';
import 'package:amazon_clonee/utils/colors_themes.dart';
import 'package:amazon_clonee/utils/constant.dart';
import 'package:amazon_clonee/utils/utils.dart';
import 'package:amazon_clonee/widget/rating_stars_widget.dart';
import 'package:amazon_clonee/widget/search_bar_widget.dart';
import 'package:amazon_clonee/widget/user_details_bar.dart';
import 'package:flutter/material.dart';

class ProductScreenState extends StatefulWidget {
  final ProductModel productModel;
  const ProductScreenState({super.key, required this.productModel});

  @override
  State<ProductScreenState> createState() => _ProductScreenStateState();
}

class _ProductScreenStateState extends State<ProductScreenState> {
  @override
  Widget build(BuildContext context) {
    // Size screenSize = Utils().getScreenSize();
    return SafeArea(
        child: Scaffold(
      appBar: SearchBarWidget(isReadOnly: true, hasBackBotton: true),
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: kAppBarHeight / 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              widget.productModel.sellerName,
                              style: const TextStyle(
                                  color: activeCyancolor, fontSize: 16),
                            ),
                          ),
                          Text(widget.productModel.productName)
                        ],
                      ),
                      // const Spacer(),
                      // const SizedBox(
                      //   width: 110,
                      // ),
                      RatingStarwidget(rating: widget.productModel.rating)
                    ],
                  ),
                )
              ],
            ),
          )),
          UserDetailsBar(
              offset: 0,
              userdetails: UserDetailsModel(name: "sajid", address: "dewas")),
        ],
      ),
    ));
  }
}
