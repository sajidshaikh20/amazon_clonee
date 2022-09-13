import 'package:amazon_clonee/utils/constant.dart';
import 'package:amazon_clonee/widget/category_widget.dart';
import 'package:amazon_clonee/widget/search_bar_widget.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(isReadOnly: true, hasBackBotton: false),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2.2 / 3.5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            itemCount: categoriesList.length,
            itemBuilder: (context, index) => Categorywidget(index: index)),
      ),
    );
  }
}
