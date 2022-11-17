import 'package:e_shop/widgets/cart_icon_button.dart';
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
        title: Text(
          productDetails.name,
        ),
        actions: [
          CartIconButton(
            totalAddedItem: '3',
          )
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: Container(
              height: 300,
              width: 300,
              child: Image.asset(productDetails.imgUrl)),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price: \$ ${productDetails.price.toString()}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                productDetails.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                productDetails.productDetails,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
