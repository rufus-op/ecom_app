// import 'dart:html';

import 'package:apple_store/screens/payments/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/custom_button.dart';
import '../components/grey_card.dart';
import '../provider/api_provider.dart';

class CartScreen extends StatelessWidget {
  CartScreen(this.index);
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
          'Cart Items',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .55,
            child: ListView.builder(
              itemCount: providerIns.cart.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 75,
                  // width: 140,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                        image: NetworkImage(providerIns.cart[index].image),
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
                              providerIns.cart[index].title,
                              maxLines: 2,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w400),
                            ),
                            Row(
                              children: [
                                Text(providerIns.cart[index].rating.toString(),
                                    style:
                                        const TextStyle(color: Colors.amber)),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                    '(${providerIns.cart[index].order.toString()})'),
                              ],
                            ),
                            Text(
                              '\$${providerIns.cart[index].price.toString()}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Provider.of<ApiProvider>(context, listen: false)
                                  .decrement();
                              // Provider.of<ApiProvider>(context,
                              //         listen: false)
                              //     .priceChange(index);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey.withOpacity(.18),
                              ),
                              child: const Icon(
                                Icons.remove,
                              ),
                            ),
                          ),
                          Text(
                            Provider.of<ApiProvider>(context, listen: true)
                                .number
                                .toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Provider.of<ApiProvider>(context, listen: false)
                                  .increment();
                              // Provider.of<ApiProvider>(context,
                              //         listen: false)
                              //     .priceChange(index);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey.withOpacity(.18),
                              ),
                              child: const Icon(
                                Icons.add,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Shipping Cost',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '\$${providerIns.shippingcost.toString()}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Sub Total',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '\$${providerIns.calculateSubTotal().toString()}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Discount',
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      '-\$${providerIns.discount.toString()}',
                      style: const TextStyle(color: Colors.green),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                grey_card(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            '\$${providerIns.calculateTotal()}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.blueAccent.withOpacity(.96)),
                          ),
                        ],
                      ),
                      Custom_button(
                        text: 'Pay',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentScreen(),
                              ));
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
