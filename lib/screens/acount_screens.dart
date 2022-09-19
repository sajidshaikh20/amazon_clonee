import 'package:amazon_clonee/model/user_details.dart';
import 'package:amazon_clonee/providers/user_details_provider.dart';
import 'package:amazon_clonee/screens/sell_screen.dart';
import 'package:amazon_clonee/utils/colors_themes.dart';
import 'package:amazon_clonee/utils/constant.dart';
import 'package:amazon_clonee/utils/utils.dart';
import 'package:amazon_clonee/widget/account_screen_app_bar.dart';
import 'package:amazon_clonee/widget/custom_main_botton.dart';
import 'package:amazon_clonee/widget/product_showcase_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    Size screeSize = Utils().getScreenSize();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AccountScreenAppBar(),
        body: SingleChildScrollView(
          child: SizedBox(
            height: screeSize.height,
            width: screeSize.width,
            child: Column(
              children: [
                const IntroductionWidgetAccounScreen(),
                CustomMainBotton(
                    // ignore: sort_child_properties_last
                    child: const Text(
                      "Sign Out",
                      style: TextStyle(color: Colors.black),
                    ),
                    color: Colors.orange,
                    isLoading: false,
                    onPressed: () {}),
                CustomMainBotton(
                    // ignore: sort_child_properties_last
                    child: const Text(
                      "Sell",
                      style: TextStyle(color: Colors.black),
                    ),
                    color: Colors.yellow,
                    isLoading: false,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SellScreen()));
                    }),
                ProductShowcaseListView(
                    title: "Yours order", children: testChildren),
                // ProductShowcaseListView(
                //     title: "Yours order", children: testChildren),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Order Request",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: const Text(
                              "Order black shoe",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            subtitle: const Text("Address: somewhere on earth"),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.check)),
                          );
                        }))
              ],
            ),
          ),
        ));
  }
}

class IntroductionWidgetAccounScreen extends StatelessWidget {
  const IntroductionWidgetAccounScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDetailsModel userDetailsModel =
        Provider.of<UserDetailsProvider>(context).userDetails;
    return Container(
      height: kAppBarHeight / 2,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: backgroundGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Container(
        height: kAppBarHeight / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.white.withOpacity(0.000000000001)],
              // colors: backgroundGradient,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Hello,",
                    style: TextStyle(color: Colors.grey[800], fontSize: 26)),
                TextSpan(
                    text: " ${userDetailsModel.name}",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 26,
                        fontWeight: FontWeight.bold))
              ])),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://yt3.ggpht.com/ytc/AMLnZu82xen1nYSPPxaJhK0IlU39vEzm9fsf84X6AuBU=s900-c-k-c0x00ffffff-no-rj'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
