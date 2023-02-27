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
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .7,
              child: ListView.builder(
                itemCount: providerIns.cart.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 70,
                    // width: 140,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          image: NetworkImage(
                              providerIns.productInfo[index].imageLink),
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                          height: 60,
                          width: 60,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                providerIns.productInfo[index].productName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  Text(
                                      providerIns
                                          .productInfo[index].productRatings
                                          .toString(),
                                      style:
                                          const TextStyle(color: Colors.amber)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                      '(${providerIns.productInfo[index].orders.toString()})'),
                                ],
                              ),
                              Text(
                                '\$${providerIns.productInfo[index].productPrice.toString()}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            Positioned(
                              right: 20,
                              child: InkWell(
                                onTap: () {
                                  providerIns.cart.remove(index);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.grey.withOpacity(.18),
                                  ),
                                  child: const Icon(
                                    Icons.cancel_outlined,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Provider.of<ApiProvider>(context,
                                            listen: false)
                                        .decrement();
                                    Provider.of<ApiProvider>(context,
                                            listen: false)
                                        .priceChange(index);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.symmetric(
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
                                  Provider.of<ApiProvider>(context,
                                          listen: true)
                                      .number
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  onTap: () {
                                    Provider.of<ApiProvider>(context,
                                            listen: false)
                                        .increment();
                                    Provider.of<ApiProvider>(context,
                                            listen: false)
                                        .priceChange(index);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.symmetric(
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
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Shipping Cost',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '\$100',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sub Total',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '\$${Provider.of<ApiProvider>(context, listen: false).newprice.toString()}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Discount',
                        style: TextStyle(color: Colors.green),
                      ),
                      Text(
                        '-\$${Provider.of<ApiProvider>(context, listen: false).discount.toString()}',
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
                              '\$${Provider.of<ApiProvider>(context, listen: true).total.toString()}',
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
                ],
              ),
            )
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => PaymentScreen(),
            //           ));
            //     },
            //     child: const Text('Pay'))
          ],
        ),
      )),
    );
  }
}
