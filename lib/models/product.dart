import 'package:meta/meta.dart';
import 'dart:convert';

class Product {
    String image;
    int price;

    Product({
        required this.image,
        required this.price,
    });

      factory Product.fromJson(Map<String, dynamic> json) => Product(
        image: json["image"],
        price: json["price"],
      );


    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        image: json["image"],
        price: json["price"],
    );

    Map<String, dynamic> toMap() => {
        "image": image,
        "price": price,
    };
}
