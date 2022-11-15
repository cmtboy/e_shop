import 'package:e_shop/providers/product_provider.dart';
import 'package:e_shop/screens/home_screen/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<ProductProvider>(context).getProducts();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Home"),
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'ProductDetails'),
          child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2 / 2.7,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => HomeProduct(
                  productImage: products[index].imgUrl,
                  productName: products[index].name,
                  productPrice: products[index].price)),
        ));
  }
}
