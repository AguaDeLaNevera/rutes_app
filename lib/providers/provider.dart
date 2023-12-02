import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:plantilla_login_register/models/product.dart';

class Information extends ChangeNotifier {
  final String _baseUrl =
      'api-tenda-7058f-default-rtdb.europe-west1.firebasedatabase.app';

  List<Product> llistaProductes = [];
  List<int> llistaCart = [0, 0, 0, 0, 0];
  int sumaTotal = 0;

  Information() {
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

  void suma(int index, int preu) {
    llistaCart[index] = llistaCart[index] + preu;
    sumaTotal = sumaTotal + preu;
    notifyListeners();
  }

  void resta(int index, int preu) {
    if (index >= 0 && index < llistaCart.length) {
        if (llistaCart[index] >= preu) {
            llistaCart[index] -= preu;
            sumaTotal -= preu;
        } else {
            sumaTotal -= llistaCart[index];
            llistaCart[index] = 0;
        }

        if (sumaTotal < 0) {
            sumaTotal = 0;
        }

        notifyListeners();
    }
  }
}
