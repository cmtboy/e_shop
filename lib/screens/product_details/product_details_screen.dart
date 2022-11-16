import 'package:flutter/material.dart';
import 'package:e_shop/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productId = ModalRoute.of(context)!.settings.arguments as String;
    var productDetails = Provider.of<ProductProvider>(context, listen: false)
        .getProductDetailsByID(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(productDetails.name),
      ),
      body: Column(children: [Image.asset(productDetails.imgUrl)]),
    );
  }
}
