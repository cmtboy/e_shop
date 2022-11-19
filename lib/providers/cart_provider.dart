import 'package:flutter/foundation.dart';

class Cart {
  final String id;
  final String title;
  final int quantity;
  final double price;
  Cart(
      {required this.id,
      required this.price,
      required this.quantity,
      required this.title});
}

class CartProvider with ChangeNotifier {
  Map<String, Cart> _items = {};

  void clear() {
    _items = {};
    notifyListeners();
  }

  Map<String, Cart> get cartItems {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void deleteItem(itemid) {
    _items.remove(itemid);
    notifyListeners();
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (value) => Cart(
              id: value.id,
              price: value.price,
              quantity: value.quantity + 1,
              title: value.title));
    } else {
      _items.putIfAbsent(
          productId,
          () => Cart(
              id: DateTime.now().toString(),
              price: price,
              quantity: 1,
              title: title));
    }
    notifyListeners();
  }
}
