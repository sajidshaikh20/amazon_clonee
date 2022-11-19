import 'package:amazon_clonee/model/user_details.dart';
import 'package:amazon_clonee/resources/cloudfirestore.dart';
import 'package:amazon_clonee/utils/constant.dart';
import 'package:amazon_clonee/widget/banner_add_widget.dart';
import 'package:amazon_clonee/widget/categories_horizontal_list_view_bar.dart';
import 'package:amazon_clonee/widget/loading_widget.dart';
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
  List<Widget>? discount70;
  List<Widget>? discount60;
  List<Widget>? discount50;
  List<Widget>? discount0;
  @override
  void initState() {
    super.initState();
    getData();
    controller.addListener(() {
      setState(() {
        offset = controller.position.pixels;
      });
    });
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   controller.dispose();
  // }

  void getData() async {
    List<Widget> temp70 =
        await CloudFirestoreClass().getProductFromDiscount(70);
    List<Widget> temp60 =
        await CloudFirestoreClass().getProductFromDiscount(60);
    List<Widget> temp50 =
        await CloudFirestoreClass().getProductFromDiscount(50);
    List<Widget> temp0 = await CloudFirestoreClass().getProductFromDiscount(0);
    // print("everything is done");
    setState(() {
      discount70 = temp70;
      discount60 = temp60;
      discount50 = temp50;
      discount0 = temp0;
    });
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
      body: discount70 != null &&
              discount60 != null &&
              discount50 != null &&
              discount0 != null
          ? Stack(
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
                          title: "UP to 70% off", children: discount70!),
                      ProductShowcaseListView(
                          title: "UP to 60% off", children: discount60!),
                      ProductShowcaseListView(
                          title: "UP to 50% off", children: discount50!),
                      ProductShowcaseListView(
                          title: "UP to explore", children: discount0!),
                    ],
                  ),
                ),
                UserDetailsBar(
                  offset: offset,
                ),
              ],
            )
          : const LoadingWidget(),
    );
  }
}
