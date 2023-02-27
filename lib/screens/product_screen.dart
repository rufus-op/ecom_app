import 'package:apple_store/components/custom_button.dart';
import 'package:apple_store/components/grey_card.dart';
import 'package:apple_store/provider/api_provider.dart';
import 'package:apple_store/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  int index;
  ProductScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    grey_card(
                        height: 250,
                        child: Image(
                          image: NetworkImage(Provider.of<ApiProvider>(context)
                              .productInfo[index]
                              .imageLink),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Provider.of<ApiProvider>(context)
                              .productInfo[index]
                              .productName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        InkWell(
                          onTap: () {
                            Provider.of<ApiProvider>(context, listen: false)
                                .favButton();
                          },
                          child: (Provider.of<ApiProvider>(
                            context,
                          ).isFav)
                              ? const Icon(Icons.favorite_outlined)
                              : const Icon(Icons.favorite_outline_rounded),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[600],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          Provider.of<ApiProvider>(context)
                              .productInfo[index]
                              .productRatings
                              .toString(),
                          style: TextStyle(color: Colors.grey.withOpacity(.8)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '(${Provider.of<ApiProvider>(context).productInfo[index].orders.toString()})',
                          style: TextStyle(color: Colors.blue.withOpacity(.5)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, enim ad laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor inint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: TextStyle(color: Colors.grey.withOpacity(.8)),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(.18),
                      thickness: 1.5,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.pages_outlined),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Product Details'),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .48,
                        ),
                        const Icon(Icons.arrow_back,
                            textDirection: TextDirection.rtl),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(.18),
                      thickness: 1.5,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.pages_outlined),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Reviews'),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .6,
                        ),
                        const Icon(Icons.arrow_back,
                            textDirection: TextDirection.rtl),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
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
                                '\$${Provider.of<ApiProvider>(context).productInfo[index].productPrice.toString()}',
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
                              Provider.of<ApiProvider>(context, listen: false)
                                  .cart
                                  .add(index);
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
      ),
    );
  }
}
