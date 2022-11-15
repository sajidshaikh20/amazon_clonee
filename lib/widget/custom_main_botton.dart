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
            // ignore: deprecated_member_use
            primary: color,
            fixedSize: Size(screeSize.width * 0.6, 40)),
        onPressed: onPressed,
        child: !isLoading
            ? child
            : const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ));
  }
}
