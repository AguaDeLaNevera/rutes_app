import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:plantilla_login_register/models/product.dart';

class Information extends ChangeNotifier {
  final String _baseUrl =
      'api-tenda-7058f-default-rtdb.europe-west1.firebasedatabase.app';

  List<Product> llistaProductes = [];

  InfoProvider() {
    print('Cercador inicialitzat!');
    getProducts();
  }

  Future<void> getProducts() async {
    var url = Uri.https(_baseUrl, '/products.json');
    final result = await http.get(url);
    var jsonResponse = convert.jsonDecode(result.body);
    if (jsonResponse is List) {
      for (var Producte in jsonResponse) {
        Product a = Product.fromMap(Producte);
        llistaProductes.add(a);
      }
      notifyListeners();
    }
    print(llistaProductes);
  }
}
