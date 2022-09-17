import 'package:amazon_clonee/screens/result_screens.dart';
import 'package:amazon_clonee/utils/constant.dart';
import 'package:flutter/material.dart';

class CategoriesHorizonatalViewBar extends StatelessWidget {
  const CategoriesHorizonatalViewBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: kAppBarHeight,
        width: double.infinity,
        color: Colors.white,
        child: ListView.builder(
            itemCount: categoriesList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ResultScreen(query: categoriesList[index])));
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(categoryLogos[index]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: Text(categoriesList[index]),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
