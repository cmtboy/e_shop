import 'package:flutter/foundation.dart';

import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> loadedProduct = [
    Product(
        id: '1',
        name: 'Walton Primo HM4',
        productDetails: 'Very good phone ',
        imgUrl: 'assets/images/product.png',
        price: 23.5),
    Product(
        id: '2',
        name: 'New Laptop',
        productDetails: 'My new laptop, wow',
        imgUrl: 'assets/images/product.png',
        price: 8768.3),
  ];

  List<Product> getProducts() {
    return [...loadedProduct];
  }

  Product getProductDetailsByID(String id) {
    return loadedProduct.firstWhere((element) => element.id == id);
  }
}
