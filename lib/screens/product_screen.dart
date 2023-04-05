import 'package:apple_store/components/custom_button.dart';
import 'package:apple_store/components/grey_card.dart';
import 'package:apple_store/models/product_model.dart';
import 'package:apple_store/provider/api_provider.dart';
import 'package:apple_store/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProductScreen extends StatelessWidget {
  int index;
  ProductScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final providerIns = Provider.of<ApiProvider>(context);
    ProductModel pro = ProductModel(
        image: providerIns.jsonResponse[index]['image'],
        title: providerIns.jsonResponse[index]['title'],
        rating: providerIns.jsonResponse[index]['rating']['rate'],
        order: providerIns.jsonResponse[index]['rating']['count'],
        price: providerIns.jsonResponse[index]['price'],
        ind: index);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  grey_card(
                      height: 250,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          InkWell(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(
                                Icons.arrow_back_ios,
                                size: 30,
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          Center(
                            child: Image(
                              image: NetworkImage(
                                providerIns.jsonResponse[index]['image'],
                              ),
                              fit: BoxFit.contain,
                              height: 200,
                              width: 240,
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          providerIns.jsonResponse[index]['title'],
                          maxLines: 2,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Provider.of<ApiProvider>(context, listen: false)
                              .favourite
                              .add(pro);
                          Provider.of<ApiProvider>(context, listen: false)
                              .favButton();
                        },
                        child: (Provider.of<ApiProvider>(context).isFav)
                            ? const Icon(Icons.favorite_border)
                            : const Icon(Icons.favorite_outlined),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[600],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        providerIns.jsonResponse[index]['rating']['rate']
                            .toString(),
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '(${providerIns.jsonResponse[index]['rating']['count'].toString()})',
                        style: TextStyle(color: Colors.blue.withOpacity(.8)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    providerIns.jsonResponse[index]['description'],
                    maxLines: 5,
                    style: TextStyle(color: Colors.grey.withOpacity(.8)),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(.18),
                    thickness: 1.5,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: const [
                      Icon(Icons.pages_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Product Details'),
                      Expanded(
                        child: SizedBox(),
                      ),
                      Icon(Icons.arrow_back, textDirection: TextDirection.rtl),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(.18),
                    thickness: 1.5,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: const [
                      Icon(Icons.pages_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Reviews'),
                      Expanded(
                        child: SizedBox(),
                      ),
                      Icon(Icons.arrow_back, textDirection: TextDirection.rtl),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(.18),
                    thickness: 1.5,
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
                            Text(
                              '\$${providerIns.jsonResponse[index]['price'].toString()}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              'Delivery within 1-3 Days',
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(.8),
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Custom_button(
                          text: 'Add to Bag',
                          onTap: () {
                            // Provider.of<ApiProvider>(context, listen: false)
                            //     .addToCart(pro);
                            Provider.of<ApiProvider>(context, listen: false)
                                .cart
                                .add(pro);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CartScreen(index),
                                ));
                          },
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
