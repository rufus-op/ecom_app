import 'package:apple_store/components/category_card.dart';
import 'package:apple_store/components/gridview_builder_items.dart';
import 'package:apple_store/components/listview_builder_items.dart';
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
    return ListView(
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'See all',
                style: TextStyle(fontSize: 16, color: Colors.lightBlueAccent),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // items
        const SizedBox(height: 200, child: ListviewItems()),
        const SizedBox(
          height: 15,
        ),
        //recently viewed
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recently Viewed',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'See all',
                style: TextStyle(fontSize: 16, color: Colors.lightBlueAccent),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //items grid
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const GridViewItems()),
      ],
    );
  }
}
