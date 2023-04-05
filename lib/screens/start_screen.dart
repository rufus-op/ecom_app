// import 'dart:convert';

// import 'package:apple_store/models/new_model.dart';
import 'dart:async';

import 'package:apple_store/provider/api_provider.dart';
import 'package:apple_store/screens/cart_screen.dart';
import 'package:apple_store/screens/favourite_screen.dart';
import 'package:apple_store/screens/home.dart';
// import 'package:apple_store/screens/login_screen.dart';
// import 'package:apple_store/screens/product_screen.dart';
// import 'package:apple_store/services/firebase_auth_service.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
// import '../components/category_card.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    // final providerIns = Provider.of<ApiProvider>(context);
    List screens = [Home(), FavouriteScreen(1), CartScreen(1)];
    return Scaffold(
      body: screens.elementAt(_selectedPage),
      bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedPage,
          destinations: [
            InkWell(
              onTap: () {
                setState(() {
                  _selectedPage = 0;
                });
              },
              child: _selectedPage == 0
                  ? const Icon(Icons.home)
                  : const Icon(Icons.home_outlined),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _selectedPage = 1;
                });
              },
              child: _selectedPage == 1
                  ? const Icon(Icons.favorite_rounded)
                  : const Icon(Icons.favorite_border_rounded),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _selectedPage = 2;
                });
              },
              child: _selectedPage == 2
                  ? const Icon(Icons.shopping_bag)
                  : const Icon(Icons.shopping_bag_outlined),
            ),
          ],
          height: 60),
    );
  }
}
