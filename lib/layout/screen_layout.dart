// ignore_for_file: must_call_super

import 'dart:ffi';

import 'package:amazon_clonee/providers/user_details_provider.dart';
import 'package:amazon_clonee/resources/cloudfirestore.dart';
import 'package:amazon_clonee/utils/colors_themes.dart';
import 'package:amazon_clonee/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({Key? key}) : super(key: key);

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  PageController pageController = PageController();
  int currentPage = 0;
  Color greyline = Colors.grey[400]!;
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  changePage(int page) {
    pageController.jumpToPage(page);
    setState(() {
      currentPage = page;
    });
  }

  @override
  void initState() {
    super.initState();
    CloudFirestoreClass().getNameAndAddress();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<UserDetailsProvider>(context).getData();
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          body: PageView(controller: pageController, children: screens),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: greyline, width: 1))),
            child: TabBar(
                indicator: const BoxDecoration(
                    border: Border(
                        top: BorderSide(color: activeCyancolor, width: 4))),
                onTap: changePage,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    child: Icon(
                      Icons.home_outlined,
                      color: currentPage == 0 ? activeCyancolor : Colors.black,
                    ),
                  ),
                  Tab(
                    child: Icon(
                      Icons.account_circle_outlined,
                      color: currentPage == 1 ? activeCyancolor : Colors.black,
                    ),
                  ),
                  Tab(
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: currentPage == 2 ? activeCyancolor : Colors.black,
                    ),
                  ),
                  Tab(
                    child: Icon(
                      Icons.menu,
                      color: currentPage == 3 ? activeCyancolor : Colors.black,
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
