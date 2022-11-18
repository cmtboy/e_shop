import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class CartIconButton extends StatelessWidget {
  const CartIconButton({required this.totalAddedItem, Key? key})
      : super(key: key);
  final String totalAddedItem;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, 'cartScreen');
      },
      icon: Badge(
        badgeContent: Text('$totalAddedItem'),
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
