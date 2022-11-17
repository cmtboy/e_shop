import 'package:flutter/foundation.dart';

import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> loadedProduct = [
    Product(
        id: '1',
        name: 'Walton Primo HM4 4GB RAM',
        productDetails:
            'improved tolerability favourite no drug interaction, walton is bangladeshi brand',
        imgUrl: 'assets/images/product.png',
        price: 23.5),
    Product(
        id: '2',
        name: 'New Laptop',
        productDetails: 'My new laptop, wow',
        imgUrl: 'assets/images/product.png',
        price: 8768.3),
    Product(
        id: '3',
        name: 'New Laptop',
        productDetails: 'My new laptop, wow',
        imgUrl: 'assets/images/product1.png',
        price: 8768.3),
    Product(
        id: '4',
        name: 'New Laptop',
        productDetails: 'My new laptop, wow',
        imgUrl: 'assets/images/product.png',
        price: 8768.3),
    Product(
        id: '5',
        name: 'New Laptop',
        productDetails: 'My new laptop, wow',
        imgUrl: 'assets/images/product1.png',
        price: 8768.3),
  ];

  List<Product> getProducts() {
    return [...loadedProduct];
  }

  Product getProductDetailsByID(String id) {
    return loadedProduct.firstWhere((element) => element.id == id);
  }
}
