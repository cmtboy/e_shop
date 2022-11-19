import 'package:e_shop/providers/cart_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Order {
  final String id;
  final double amount;
  final List<Cart> products;
  final DateTime dateTime;
  Order(
      {required this.amount,
      required this.dateTime,
      required this.id,
      required this.products});
}

class OrderProvider with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(List<Cart> cartProducts, double total) {
    _orders.insert(
      0,
      Order(
          amount: total,
          dateTime: DateTime.now(),
          id: DateTime.now().toString(),
          products: cartProducts),
    );
    notifyListeners();
  }
}
