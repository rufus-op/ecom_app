// import 'dart:html';

// import 'package:apple_store/screens/payments/payment_screen.dart';
import 'package:apple_store/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../components/custom_button.dart';
// import '../components/grey_card.dart';
import '../provider/api_provider.dart';

// ignore: must_be_immutable
class FavouriteScreen extends StatelessWidget {
  FavouriteScreen(this.index, {super.key});
  int index;

  @override
  Widget build(BuildContext context) {
    final providerIns = Provider.of<ApiProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.withOpacity(.3),
        centerTitle: true,
        title: const Text(
          'Favourites',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height * .65,
        child: ListView.builder(
          itemCount: providerIns.favourite.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductScreen(
                          index: providerIns.favourite[index].ind!),
                    ));
              },
              child: Container(
                height: 75,
                // width: 140,
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(.3)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: NetworkImage(providerIns.favourite[index].image),
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      height: 60,
                      width: 60,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 140,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            providerIns.favourite[index].title,
                            maxLines: 2,
                            style: const TextStyle(fontWeight: FontWeight.w400),
                          ),
                          Row(
                            children: [
                              Text(
                                  providerIns.favourite[index].rating
                                      .toString(),
                                  style: const TextStyle(color: Colors.amber)),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                  '(${providerIns.favourite[index].order.toString()})'),
                            ],
                          ),
                          Text(
                            '\$${providerIns.favourite[index].price.toString()}',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}
