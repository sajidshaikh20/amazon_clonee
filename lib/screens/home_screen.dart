import 'package:amazon_clonee/widget/categories_horizontal_list_view_bar.dart';
import 'package:amazon_clonee/widget/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      // drawer: const Drawer(),
      appBar: SearchBarWidget(
        isReadOnly: true,
        hasBackBotton: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoriesHorizonatalViewBar(),
          ],
        ),
      ),
    );
  }
}
