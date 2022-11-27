import 'package:e_shop/providers/product_provider.dart';
import 'package:e_shop/screens/manage_products/manage_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageScreen extends StatelessWidget {
  const ManageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productDetails = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "EditProductScreen");
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productDetails.loadedProduct.length,
          itemBuilder: (BuildContext context, int index) {
            return ManageProductWidget(
                id: productDetails.loadedProduct[index].id,
                imageUrl: productDetails.loadedProduct[index].imgUrl,
                productName: productDetails.loadedProduct[index].name);
          },
        ),
      ),
    );
  }
}
