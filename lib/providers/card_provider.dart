import 'package:flutter/foundation.dart';

class CartProvider extends ChangeNotifier {
  double _sumaTotal = 0;

  double get sumaTotal => _sumaTotal;

  void addToCart(int price) {
    _sumaTotal += price;
    notifyListeners();
  }

  void removeFromCart(int price) {
    _sumaTotal -= price;
    print(_sumaTotal);
    notifyListeners();
  }
}
