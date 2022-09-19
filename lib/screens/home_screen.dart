import 'package:amazon_clonee/model/user_details.dart';
import 'package:amazon_clonee/utils/constant.dart';
import 'package:amazon_clonee/widget/banner_add_widget.dart';
import 'package:amazon_clonee/widget/categories_horizontal_list_view_bar.dart';
import 'package:amazon_clonee/widget/product_showcase_list_view.dart';
import 'package:amazon_clonee/widget/search_bar_widget.dart';
import 'package:amazon_clonee/widget/user_details_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        offset = controller.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      // drawer: const Drawer(),
      appBar: SearchBarWidget(
        isReadOnly: true,
        hasBackBotton: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                const SizedBox(
                  height: kAppBarHeight / 2,
                ),
  CategoriesHorizonatalViewBar(),
   BannerAdWidget(),
                ProductShowcaseListView(
                    title: "UP to 70% off", children: testChildren),
                ProductShowcaseListView(
                    title: "UP to 60% off", children: testChildren),
                ProductShowcaseListView(
                    title: "UP to 50% off", children: testChildren),
                ProductShowcaseListView(
                    title: "UP to explore", children: testChildren),
              ],
            ),
          ),
          UserDetailsBar(
            offset: offset,
           
          ),
        ],
      ),
    );
  }
}
