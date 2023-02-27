// To parse this JSON data, do
//
//     final photos = photosFromJson(jsonString);


import 'dart:convert';

List<Photos> photosFromJson(String str) => List<Photos>.from(json.decode(str).map((x) => Photos.fromJson(x)));

String photosToJson(List<Photos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Photos {
    Photos({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    int userId;
    int id;
    String title;
    String body;

    factory Photos.fromJson(Map<String, dynamic> json) => Photos(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
