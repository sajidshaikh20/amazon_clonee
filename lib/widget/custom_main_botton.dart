import 'package:amazon_clonee/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomMainBotton extends StatelessWidget {
  final Widget child;
  final Color color;
  final bool isLoading;
  final VoidCallback onPressed;
  const CustomMainBotton(
      {Key? key,
      required this.child,
      required this.color,
      required this.isLoading,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screeSize = Utils().getScreenSize();
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color, fixedSize: Size(screeSize.width * 0.5, 40)),
        onPressed: onPressed,
        child: child);
  }
}
