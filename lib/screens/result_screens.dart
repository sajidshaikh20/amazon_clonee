import 'package:amazon_clonee/model/product_model.dart';
import 'package:amazon_clonee/widget/result_widget.dart';
import 'package:amazon_clonee/widget/search_bar_widget.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String query;
  const ResultScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(isReadOnly: false, hasBackBotton: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: RichText(
                text: TextSpan(children: [
              const TextSpan(
                  text: "showing results for", style: TextStyle(fontSize: 17)),
              TextSpan(text: query, style: const TextStyle(fontSize: 17)),
            ])),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 2 / 4),
                itemBuilder: (context, index) {
                  return ResultWidget(
                    product: ProductModel(
                        url:
                            "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
                        productName: "sajid_bhai",
                        cost: 100,
                        discount: 0,
                        uid: "sachin",
                        sellerName: "kavita",
                        sellerUid: "15ca16",
                        rating: 2,
                        noOfRating: 5),
                  );
                }),
          )
        ],
      ),
    );
  }
}
