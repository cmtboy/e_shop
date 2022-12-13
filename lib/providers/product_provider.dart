import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
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

  Future<void> addProduct(Product product) async {
    var url =
        Uri.https('e-shop-74df1-default-rtdb.firebaseio.com', '/products.json');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'id': DateTime.now().toString(),
            'name': product.name,
            'productDetails': product.productDetails,
            'price': product.price,
            'imgUrl': product.imgUrl
          },
        ),
      );
      var decode_data = json.decode(response.body);
      final newProduct = Product(
          // id: DateTime.now().toString(),
          id: decode_data['name'],
          name: product.name,
          productDetails: product.productDetails,
          price: product.price,
          imgUrl: product.imgUrl);
      loadedProduct.insert(0, newProduct);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  void deleteProduct(id) {
    loadedProduct.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
