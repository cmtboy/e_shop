import 'package:e_shop/screens/home_screen/product_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                HomeProduct(
                    productImage: Center(
                      child: Image.asset(
                        'assets/images/product.png',
                      ),
                    ),
                    productName: "Walton Primo HM4 4GB",
                    productPrice: "200"),
                HomeProduct(
                    productImage: Center(
                      child: Image.asset(
                        'assets/images/product1.png',
                      ),
                    ),
                    productName: 'Asus Vivobook Laptop',
                    productPrice: "500"),
              ],
            ),
            Row(
              children: [
                HomeProduct(
                    productImage: Center(
                      child: Image.asset(
                        'assets/images/product.png',
                      ),
                    ),
                    productName: "Vivo Rock V42 (2GB)",
                    productPrice: "122"),
                HomeProduct(
                    productImage: Center(
                      child: Image.asset(
                        'assets/images/product1.png',
                      ),
                    ),
                    productName: 'DELL inspiration 11GEN',
                    productPrice: "499"),
              ],
            ),
            Row(
              children: [
                HomeProduct(
                    productImage: Center(
                      child: Image.asset(
                        'assets/images/product.png',
                      ),
                    ),
                    productName: "Mobile",
                    productPrice: "200"),
                HomeProduct(
                    productImage: Center(
                      child: Image.asset(
                        'assets/images/product1.png',
                      ),
                    ),
                    productName: 'Laptop',
                    productPrice: "500"),
              ],
            ),
            Row(
              children: [
                HomeProduct(
                    productImage: Center(
                      child: Image.asset(
                        'assets/images/product.png',
                      ),
                    ),
                    productName: "Mobile",
                    productPrice: "200"),
                HomeProduct(
                    productImage: Center(
                      child: Image.asset(
                        'assets/images/product1.png',
                      ),
                    ),
                    productName: 'Laptop',
                    productPrice: "500"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
