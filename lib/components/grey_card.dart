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
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(.3)),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: child);
  }
}
