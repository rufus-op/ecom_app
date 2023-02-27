import 'package:flutter/material.dart';

class products_in_paymentPage extends StatelessWidget {
  const products_in_paymentPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: 85,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Image(
          image: NetworkImage(
              'https://www.pngmart.com/files/22/iPhone-14-PNG-File.png')),
    );
  }
}
