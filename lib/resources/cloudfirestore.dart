import 'package:amazon_clonee/model/product_model.dart';
import 'package:amazon_clonee/model/user_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class CloudFirestoreClass {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // get uploadProduct => null;
  Future uploadNameAndAddressToDatabase(
      {required UserDetailsModel user}) async {
    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .set(user.getJson());
  }

  Future getNameAndAddress() async {
    DocumentSnapshot snap = await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .get();

    UserDetailsModel userModel = UserDetailsModel.getModelFromJson(
      (snap.data() as dynamic),
    );
    // print(userModel.getJson());
    return userModel;
  }

// cost = rawcost- (rawcost*)

  Future<String> uploadProductToDatabase({
    required Uint8List? image,
    required String productName,
    required String rawCost,
    required int discount,
    required String sellerName,
    required String sellerUid,
    // required int rating,
    // required int noofRating
  }) async {
    productName.trim();
    rawCost.trim();
    String output = "something went wrong";
    if (image != null && productName != "" && rawCost != "") {
      //do something
      output = "success";
      try {} catch (e) {
        output = e.toString();
      }
    } else {
      output = "All field Must required";
    }
    return output;
  }
}
