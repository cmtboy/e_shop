import 'package:e_shop/providers/orders_provider.dart';
import 'package:e_shop/screens/order_screen/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var order = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Orders",
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: order.orders.length,
        itemBuilder: (BuildContext context, int index) {
          return OrderScreenCard(
            items: order.orders[index],
          );
        },
      ),
    );
  }
}
