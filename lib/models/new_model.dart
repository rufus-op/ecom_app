// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

List<Products> productsFromJson(String str) => List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
    Products({
        required this.title,
        required this.id,
        required this.color,
        required this.price,
        required this.availability,
    });

    String title;
    String id;
    String color;
    int price;
    String availability;

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        title: json["title"],
        id: json["id"],
        color: json["color"],
        price: json["price"],
        availability: json["availability"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "id": id,
        "color": color,
        "price": price,
        "availability": availability,
    };
}
