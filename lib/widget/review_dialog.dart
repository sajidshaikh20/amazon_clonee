import 'package:amazon_clonee/model/review_model.dart';
import 'package:amazon_clonee/providers/user_details_provider.dart';
import 'package:amazon_clonee/resources/cloudfirestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rating_dialog/rating_dialog.dart';

class ReviewDialog extends StatelessWidget {
  final String productUid;
  const ReviewDialog({super.key, required this.productUid});

  @override
  Widget build(BuildContext context) {
    return RatingDialog(
      title: const Text(
        'Type a review for this product',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      submitButtonText: 'Send',
      commentHint: 'Type here',
      onSubmitted: (RatingDialogResponse res) async {
        CloudFirestoreClass().uploadReviewToDatabase(
          productUid: productUid,
          model: ReviewModel(
              senderName:
                  Provider.of<UserDetailsProvider>(context, listen: false)
                      .userDetails
                      .name,
              description: res.comment,
              rating: res.rating.toInt()),
        );
      },
      // onSubmitted: (RatingDialogResponse res) async {
      //   // CloudFirestoreClass().uploadReviewToData(
      //   //     productUid: productUid,
      //   //     model: ReviewModel(
      //   //         senderName:
      //   //             Provider.of<UserDetailsProvider>(context, listen: false)
      //   //                 .userDetails
      //   //                 .name,
      //   //     description: res.comment,
      //   //     rating: res.rating.toInt()));
      //   CloudFirestoreClass().uploadReviewToData(
      //       productUid: productUid,
      //       model: ReviewModel(
      //           senderName: Provider.of(context, listen: false),
      //           description: res.comment,
      //           rating: res.rating.toInt()));
      // },
    );
  }
}
