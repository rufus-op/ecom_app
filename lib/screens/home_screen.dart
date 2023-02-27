// import 'dart:convert';

// import 'package:apple_store/models/new_model.dart';
import 'package:apple_store/provider/api_provider.dart';
import 'package:apple_store/screens/product_screen.dart';
import 'package:apple_store/services/firebase_auth_service.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
import '../components/category_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen(this.userName);
  String userName;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final providerIns = Provider.of<ApiProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'Hey! ${Provider.of<ApiProvider>(context).userName},'),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .4,
                        ),
                        InkWell(
                          onTap: () async {
                            await FirebaseAuthF().signOut();
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.15),
                            radius: 20,
                            child: const Icon(
                              Icons.logout_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.15),
                          radius: 20,
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'What are you buying today?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 40,
                      child: TextField(
                        textAlign: TextAlign.left,
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: searchController,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: InputDecoration(
                          hintText: 'Search Products',
                          alignLabelWithHint: true,
                          prefixIcon: const Icon(
                            Icons.search_outlined,
                            color: Colors.grey,
                          ),
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              //categories
              SizedBox(
                height: 40,
                child: Consumer<ApiProvider>(
                  builder: (context, value, child) {
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CustomChip(
                          iconData: Icons.phone_android_outlined,
                          name: 'All',
                          onTap: () {},
                        ),
                        CustomChip(
                          iconData: Icons.computer_outlined,
                          name: 'Computers',
                          onTap: () {},
                        ),
                        CustomChip(
                          iconData: Icons.headset,
                          name: 'Headset',
                          onTap: () {},
                        ),
                        CustomChip(
                          iconData: Icons.phone_android_outlined,
                          name: 'Phones',
                          onTap: () {},
                        ),
                        CustomChip(
                          iconData: Icons.settings,
                          name: 'accessoires',
                          onTap: () {},
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              //trending + see all
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Trending',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                          fontSize: 16, color: Colors.lightBlueAccent),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // items
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: providerIns.productInfo.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // providerIns.resetValues();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductScreen(
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        // height: 165,
                        width: 140,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            Center(
                              child: Image(
                                image: NetworkImage(
                                    providerIns.productInfo[index].imageLink),
                                fit: BoxFit.fitHeight,
                                alignment: Alignment.center,
                                height: 100,
                                width: 150,
                              ),
                            ),
                            Text(
                              providerIns.productInfo[index].productName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
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
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              //recently viewed
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Recently Viewed',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                          fontSize: 16, color: Colors.lightBlueAccent),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //items grid
              SizedBox(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  scrollDirection: Axis.horizontal,
                  itemCount: providerIns.productInfo.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // providerIns.resetValues();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductScreen(
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        // width: 50,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            Center(
                              child: Image(
                                image: NetworkImage(
                                    providerIns.productInfo[index].imageLink),
                                alignment: Alignment.center,
                                height: 125,
                                width: 150,
                              ),
                            ),
                            Text(
                              providerIns.productInfo[index].productName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
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
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Future<Products> fetchData() async {
//   final response = await http.get(Uri.parse(
//       'https://my-json-server.typicode.com/AnifaMd/shopping-cart/products'));
//   if (response.statusCode == 200) {
//     final jsonResponse = json.decode(response.body);

//     return Products.fromJson(jsonResponse);
//   } else {
//     throw Exception('Failed to load data');
//   }
// }
