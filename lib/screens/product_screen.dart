import 'package:amazon_clonee/model/product_model.dart';
import 'package:amazon_clonee/model/user_details.dart';
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
    return  SafeArea(child: Scaffold(
      appBar: SearchBarWidget(isReadOnly: true, hasBackBotton: true),
      body:  Stack(
        children: [
          UserDetailsBar(
                offset: 0,
                userdetails: UserDetailsModel(name: "sajid", address: "dewas")),
        ],
      ),
    ));
  }
}
