
// import 'package:flutter/foundation.dart';

// class CartProvider extends ChangeNotifier {
//   List<CartItem> items = [];

//   void addItem(Product product) {
//     final existingItem = items.firstWhere(
//       (item) => item.product == product,
//     );
//     if (existingItem != null) {
//       existingItem.incrementQuantity();
//     } else {
//       items.add(CartItem(product: product));
//     }
//     notifyListeners();
//   }

//   void removeItem(Product product) {
//     final existingItem = items.firstWhere(
//       (item) => item.product == product,
//     );
//     if (existingItem != null) {
//       if (existingItem.quantity > 1) {
//         existingItem.decrementQuantity();
//       } else {
//         items.remove(existingItem);
//       }
//       notifyListeners();
//     }
//   }

//   double get totalPrice =>
//       items.fold(0, (total, item) => total + item.totalPrice);
// }

// class Product {
//   final String name;
//   final double price;

//   Product({this.name = 'IPHONE 14 Pro', this.price = 999});
// }

// class CartItem {
//   final Product product;
//   int quantity;

//   CartItem({required this.product, this.quantity = 1});

//   double get totalPrice => product.price * quantity;

//   void incrementQuantity() {
//     quantity++;
//   }

//   void decrementQuantity() {
//     quantity--;
//   }
// }
