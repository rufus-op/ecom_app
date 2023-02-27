import 'package:flutter/material.dart';

class grey_card extends StatelessWidget {
  grey_card({required this.height, required this.child});

  double height;
  Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.withOpacity(.2),
        ),
        child: child);
  }
}
