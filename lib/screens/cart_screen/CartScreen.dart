import 'package:e_shop/providers/cart_provider.dart';
import 'package:e_shop/providers/orders_provider.dart';
import 'package:e_shop/screens/cart_screen/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Cart"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(fontSize: 20),
                      ),
                      const Spacer(),
                      Chip(
                          label:
                              Text('\$${cart.totalAmount.toStringAsFixed(2)}')),
                      TextButton(
                          onPressed: () {
                            Provider.of<OrderProvider>(context, listen: false)
                                .addOrder(cart.cartItems.values.toList(),
                                    cart.totalAmount);
                            cart.clear();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text('Order placed!'),
                              action: SnackBarAction(
                                  label: 'View',
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'OrderScreen');
                                  }),
                            ));
                          },
                          child: const Text('Order Now'))
                    ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cart.itemCount,
                itemBuilder: ((context, index) => CartItem(
                    id: cart.cartItems.values.toList()[index].id,
                    productId: cart.cartItems.keys.toList()[index],
                    price: cart.cartItems.values.toList()[index].price,
                    quantity: cart.cartItems.values.toList()[index].quantity,
                    title: cart.cartItems.values.toList()[index].title)),
              ),
            ),
          ],
        ));
  }
}
//test push