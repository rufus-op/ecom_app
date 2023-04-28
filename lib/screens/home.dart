import 'package:apple_store/components/category_card.dart';
import 'package:apple_store/provider/api_provider.dart';
import 'package:apple_store/screens/cart_screen.dart';
import 'package:apple_store/screens/login_screen.dart';
import 'package:apple_store/screens/product_screen.dart';
import 'package:apple_store/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    final providerIns = Provider.of<ApiProvider>(context);
    return SafeArea(
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
                      const Text('Welcome!'),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .4,
                      ),
                      InkWell(
                        onTap: () async {
                          await FirebaseAuthF().signOut();
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ));
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
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartScreen(),
                            )),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.15),
                          radius: 20,
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.black,
                          ),
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    'See all',
                    style:
                        TextStyle(fontSize: 16, color: Colors.lightBlueAccent),
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
              child: FutureBuilder(
                future: providerIns.getUsers(),
                builder: (context, snapshot) {
                  // if(snapshot.hasData){}
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return providerIns.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: providerIns.jsonResponse!.length,
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
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black.withOpacity(.3)),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Center(
                                        child: Hero(
                                          tag: index,
                                          child: Image(
                                            image: NetworkImage(providerIns
                                                .jsonResponse![index]['image']),
                                            fit: BoxFit.contain,
                                            alignment: Alignment.center,
                                            height: 85,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        providerIns.jsonResponse![index]
                                            ['title'],
                                        maxLines: 2,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                              providerIns.jsonResponse![index]
                                                      ['rating']['rate']
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Color(0xFffFBE30))),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                              '(${providerIns.jsonResponse![index]['rating']['count'].toString()})'),
                                        ],
                                      ),
                                      Text(
                                        '\$${providerIns.jsonResponse![index]['price'].toString()}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                ));
                          },
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    'See all',
                    style:
                        TextStyle(fontSize: 16, color: Colors.lightBlueAccent),
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
                child: FutureBuilder(
                    future: providerIns.getUsers(),
                    builder: (context, snapshot) {
                      // if(snapshot.hasData){}
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        scrollDirection: Axis.vertical,
                        itemCount: providerIns.jsonResponse!.length,
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black.withOpacity(.3)),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Center(
                                      child: Hero(
                                        tag: index,
                                        child: Image(
                                          image: NetworkImage(providerIns
                                              .jsonResponse![index]['image']),
                                          fit: BoxFit.fitHeight,
                                          alignment: Alignment.center,
                                          height: 85,
                                          width: 80,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      providerIns.jsonResponse![index]['title'],
                                      maxLines: 2,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            providerIns.jsonResponse![index]
                                                    ['rating']['rate']
                                                .toString(),
                                            style: const TextStyle(
                                                color: Color(0xFffFBE30))),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                            '(${providerIns.jsonResponse![index]['rating']['count'].toString()})'),
                                      ],
                                    ),
                                    Text(
                                      '\$${providerIns.jsonResponse![index]['price'].toString()}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                ),
                              ));
                        },
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
