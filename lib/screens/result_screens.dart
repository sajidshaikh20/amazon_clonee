import 'package:amazon_clonee/model/product_model.dart';
import 'package:amazon_clonee/widget/loading_widget.dart';
import 'package:amazon_clonee/widget/result_widget.dart';
import 'package:amazon_clonee/widget/search_bar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: "Showing Results for ",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: query,
                    style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ])),
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection("products")
                    .where("productName", isEqualTo: query)
                    .get(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const LoadingWidget();
                  } else {
                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, childAspectRatio: 2 / 3.5),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          ProductModel product = ProductModel.getModelFromJson(
                              json: snapshot.data!.docs[index].data());
                          return ResultWidget(product: product);
                        });
                    // return GridView.builder(
                    //     gridDelegate:
                    //         const SliverGridDelegateWithFixedCrossAxisCount(
                    //             crossAxisCount: 3, childAspectRatio: 2 / 3.5),
                    //     itemCount: snapshot.data!.docs.length,
                    //     itemBuilder: (context, index) {
                    //       ProductModel product = ProductModel.getModelFromJson(
                    //           json: snapshot.data!.docs[index].data());
                    //       return ResultWidget(product: product);
                    //     });
                  }
                }),
          )
        ],
      ),
    );
  }
}
