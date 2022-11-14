import 'package:amazon_clonee/screens/result_screens.dart';
import 'package:amazon_clonee/screens/search_screen.dart';
import 'package:amazon_clonee/utils/colors_themes.dart';
import 'package:amazon_clonee/utils/constant.dart';
import 'package:amazon_clonee/utils/utils.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchBarWidget extends StatelessWidget with PreferredSizeWidget {
  final bool isReadOnly;
  final bool hasBackBotton;
  SearchBarWidget(
      {Key? key, required this.isReadOnly, required this.hasBackBotton})
      : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);
  @override
  final Size preferredSize;
  OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: const BorderSide(color: Colors.grey, width: 1));

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return SafeArea(
      child: Container(
        // color: Colors.pink,

        height: kAppBarHeight,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: backgroundGradient,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          hasBackBotton
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back))
              : Container(),
          SizedBox(
              width: screenSize.width * 0.7,
              // height: screenSize.height * 0.5,
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      spreadRadius: 1,
                      offset: const Offset(0, 5))
                ]),
                child: TextField(
                  onSubmitted: (String query) {
                    // print("submited ${query} ");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen(query: query)));
                  },
                  readOnly: isReadOnly,
                  onTap: () {
                    if (isReadOnly) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen()));
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: Colors.black,
                    ),
                    hintText: "Search Amazon",
                    fillColor: Colors.white,
                    filled: true,
                    border: border,
                    contentPadding: const EdgeInsets.all(12),
                    focusedBorder: border,
                    suffixIcon: const Icon(
                      Icons.center_focus_strong_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              )),
          IconButton(
            onPressed: () {},
            iconSize: 30,
            icon: const Icon(
              Icons.mic_none_outlined,
            ),
          )
        ]),
      ),
    );
  }
}
