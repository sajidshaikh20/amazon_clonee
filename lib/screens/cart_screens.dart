import 'package:amazon_clonee/model/product_model.dart';
import 'package:amazon_clonee/model/user_details.dart';
import 'package:amazon_clonee/providers/user_details_provider.dart';
import 'package:amazon_clonee/resources/cloudfirestore.dart';
import 'package:amazon_clonee/utils/colors_themes.dart';
import 'package:amazon_clonee/utils/constant.dart';
import 'package:amazon_clonee/utils/utils.dart';
import 'package:amazon_clonee/widget/cart_item.dart';
import 'package:amazon_clonee/widget/custom_main_botton.dart';
import 'package:amazon_clonee/widget/search_bar_widget.dart';
import 'package:amazon_clonee/widget/user_details_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("users")
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .collection("cart")
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CustomMainBotton(
                                color: yellowColor,
                                isLoading: true,
                                onPressed: () {},
                                child: const Text(
                                  "Loading",
                                ));
                          } else {
                            return CustomMainBotton(
                                color: yellowColor,
                                isLoading: false,
                                onPressed: () async {
                                  await CloudFirestoreClass()
                                      .buyAllItemsInCart(userDetails: Provider.of<UserDetailsProvider>(context,listen: false).userDetails);
                                  Utils().showSnackBar(
                                      context: context, content: "Done");
                                },
                                child: Text(
                                  "Proceed to buy (${snapshot.data!.docs.length})item",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(color: Colors.black),
                                ));
                          }
                        })),
                Expanded(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .collection("cart")
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container();
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              ProductModel model =
                                  ProductModel.getModelFromJson(
                                      json: snapshot.data!.docs[index].data());
                              return CartItemsWidget(product: model);
                            });
                      }
                    },
                  ),
                )
              ],
            ),
            const UserDetailsBar(
              offset: 0,
            ),
          ],
        ),
      ),
    );
  }
}
