// import 'package:apple_store/services/api_get_service.dart';
import 'dart:convert';

// import 'package:apple_store/models/product_model.dart';
import 'package:apple_store/models/user_model.dart';
import 'package:flutter/foundation.dart';
// import 'package:apple_store/services/api_get_service.dart';
import 'package:http/http.dart' as http;

import '../models/me_products_model.dart';

class ApiProvider extends ChangeNotifier {
  // List products = [];
  // Product? pro;
  Datum? user;
  dynamic comments;
  bool loading = false;
  int price = 999;
  int tabNum = 1;
  int shippingcost = 100;
  int newprice = 0;
  int discount = 99;
  int total = 0;
  int number = 0;
  bool isFav = false;
  bool isLoading = false;
  String userName = 'User';
  String address = 'C-75,Block 10,Gulshan-e-Iqbal';
  String city = 'Karachi';

  favButton() {
    // if (isFav == true) {
    //   return isFav = false;
    // } else if (isFav == false) {
    //   return isFav == true;
    // }
    isFav != isFav;
    notifyListeners();
  }

  // resetValues() {
  //   newprice = 0;
  //   number = 0;
  //   notifyListeners();
  // }

  List cart = [];
  List<ProductsDetails> productInfo = [
    ProductsDetails(
        imageLink: 'https://www.pngmart.com/files/22/iPhone-14-Pro-Max-PNG.png',
        productName: 'IPHONE 14 PRO MAX',
        productPrice: 1099,
        productRatings: 4.8,
        orders: 4567),
    ProductsDetails(
        imageLink:
            'https://www.apple.com/v/iphone-13-pro/g/images/overview/design/finishes_1_alpine_green__bxgqurawflau_large.jpg',
        productName: 'IPHONE 14 PRO',
        productPrice: 999,
        productRatings: 4.7,
        orders: 3456),
    ProductsDetails(
        imageLink:
            'https://www.store4u.pk/wp-content/uploads/2022/12/iPhone-14-blue.png',
        productName: 'IPHONE 14 PLUS',
        productPrice: 899,
        productRatings: 4.7,
        orders: 2345),
    ProductsDetails(
        imageLink: 'https://www.pngmart.com/files/22/iPhone-14-PNG-File.png',
        productName: 'IPHONE 14',
        productPrice: 799,
        productRatings: 4.6,
        orders: 1245),
  ];

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

  priceChange(int index) {
    newprice = (productInfo[index].productPrice) * number;
    // newprice = price * number;
    notifyListeners();
  }

  calculateTotal() {
    total = newprice + shippingcost - discount;
    notifyListeners();
    return total;
  }

  // getProduct() async {
  //   loading = true;
  //   pro = await fetchPhotos();
  //   loading = false;
  //   notifyListeners();
  // }
  Future getUsers() async {
    loading = true;
    Future<List<dynamic>> fetchData() async {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Failed to load data');
      }
    }

    loading = false;
    notifyListeners();
  }
}
