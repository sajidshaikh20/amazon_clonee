import 'package:amazon_clonee/utils/colors_themes.dart';
import 'package:amazon_clonee/utils/utils.dart';
import 'package:flutter/material.dart';

class ProductShowcaseListView extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const ProductShowcaseListView(
      {Key? key, required this.title, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    double height = screenSize.height / 4;
    double titleHeight = 25;
    return Container(
      height: height,
      width: screenSize.width,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Show more",
                style: TextStyle(color: activeCyancolor),
              )
            ],
          )
        ],
      ),
    );
  }
}
