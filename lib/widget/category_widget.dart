import 'package:amazon_clonee/screens/result_screens.dart';
import 'package:amazon_clonee/utils/constant.dart';
import 'package:flutter/material.dart';

class Categorywidget extends StatelessWidget {
  final int index;
  const Categorywidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              query: categoriesList[index],
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 8,
                spreadRadius: 1)
          ],
        ),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(categoryLogos[index]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                categoriesList[index],
                style: const TextStyle(
                    fontWeight: FontWeight.w500, letterSpacing: .05),
              ),
            )
          ],
        )),
      ),
    );
  }
}
