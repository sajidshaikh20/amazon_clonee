import 'package:amazon_clonee/utils/colors_themes.dart';
import 'package:amazon_clonee/utils/constant.dart';
import 'package:amazon_clonee/utils/utils.dart';
import 'package:amazon_clonee/widget/account_screen_app_bar.dart';
import 'package:flutter/material.dart';

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
                Container(
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
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(0.000000000001)
                          ],
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
                                text: "hello",
                                style: TextStyle(
                                    color: Colors.grey[800], fontSize: 26)),
                            TextSpan(
                                text: " Sajid",
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
                )
              ],
            ),
          ),
        ));
  }
}
