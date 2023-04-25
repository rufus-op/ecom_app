// import 'package:apple_store/services/api_get_service.dart';
import 'dart:convert';

// import 'package:apple_store/models/product_model.dart';
// import 'package:apple_store/models/user_model.dart';
import 'package:apple_store/models/product_model.dart';
import 'package:flutter/foundation.dart';
// import 'package:apple_store/services/api_get_service.dart';
import 'package:http/http.dart' as http;

// import '../models/me_products_model.dart';

class ApiProvider extends ChangeNotifier {
  // List products = [];
  // Product? pro;
  // Datum? user;
  dynamic comments;
  bool loading = false;
  // int price = 999;
  // int tabNum = 1;
  int shippingcost = 100;
  int newprice = 0;
  int discount = 99;

  int number = 0;
  bool isFav = false;
  bool isLoading = false;
  String userName = 'User';
  String address = 'C-75,Block 10,Gulshan-e-Iqbal';
  String city = 'Karachi';
  int selectedPage = 0;
  double subTotal = 0;

  double calculateSubTotal() {
    subTotal = cart.fold(0, (sum, item) => sum + item.price);
    return subTotal;
  }

  double total = 0;
  calculateTotal() {
    total = calculateSubTotal() + shippingcost.toDouble() - discount.toDouble();
    return total.toStringAsFixed(1);
  }

  // favButton() {
  //   isFav != isFav;
  //   notifyListeners();
  // }

  List<ProductModel> cart = [];

  List<ProductModel> favourite = [];

  showLoading() {
    isLoading = true;
    notifyListeners();
  }

  dontshowLoading() {
    isLoading = false;
    notifyListeners();
  }

  increment() {
    number++;
    notifyListeners();
  }

  decrement() {
    if (number > 0) {
      number--;
      notifyListeners();
    }
  }

  // ignore: prefer_typing_uninitialized_variables
  List? jsonResponse;
  getUsers() async {
    loading = true;

    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to load data');
    }
    loading = false;
    notifyListeners();
  }
}
