import 'package:apple_store/provider/api_provider.dart';
import 'package:apple_store/services/gmaps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../components/custom_button.dart';
import '../../components/grey_card.dart';
import '../../components/products_in_paymentPage.dart';

class PaymentScreen extends StatelessWidget {
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final providerIns = Provider.of<ApiProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              grey_card(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                          ),
                        ),
                        const Text(
                          'Payment',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const Icon(
                          Icons.more_horiz,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Bag',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey.withOpacity(.18),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                        itemCount: providerIns.cart.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 60,
                            width: 80,
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.black.withOpacity(.3))),
                            child: Image(
                              image:
                                  NetworkImage(providerIns.cart[index].image),
                              fit: BoxFit.contain,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Address',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  InkWell(
                    onTap: () {
                      // BottomSheet(
                      //   onClosing: () {},
                      //   builder: (context) {},
                      // );
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              color: Colors.grey.withOpacity(.3),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: addressController,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter Address',
                                  ),
                                ),
                                TextField(
                                  controller: cityController,
                                  decoration: const InputDecoration(
                                    hintText: 'City',
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                ElevatedButton(
                                  onPressed: () {
                                    Provider.of<ApiProvider>(context,
                                            listen: false)
                                        .address = addressController.text;
                                    Provider.of<ApiProvider>(context,
                                            listen: false)
                                        .city = cityController.text;

                                    Navigator.pop(context);
                                  },
                                  child: const Text('Save'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: const Text(
                      'Change',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Gmaps(),
                          ));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: const Image(
                        height: 80,
                        width: 110,
                        image: NetworkImage(
                            'https://ak.picdn.net/shutterstock/videos/4677119/thumb/2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Address',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        Provider.of<ApiProvider>(context, listen: false)
                            .address
                            .toString(),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: const TextStyle(
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        Provider.of<ApiProvider>(context, listen: false)
                            .city
                            .toString(),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: const TextStyle(
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Payment',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              //payment method selection
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/selectPayment');
                },
                child: grey_card(
                  height: 80,
                  child: Row(
                    children: [
                      Icon(
                        Icons.credit_card,
                        size: 50,
                        color: Colors.blue.withOpacity(.7),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Credit Card',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '625843993243',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                      const Expanded(
                        child: SizedBox(
                          width: 105,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_back,
                        textDirection: TextDirection.rtl,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 55,
              ),
              //cost calculations
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
                          '\$${providerIns.calculateTotal().toString()}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.blueAccent.withOpacity(.96)),
                        ),
                      ],
                    ),
                    Custom_button(
                      text: 'Pay',
                      onTap: () {},
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      )),
    );
  }
}
