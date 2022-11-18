import 'package:flutter/material.dart';

class HomeProduct extends StatelessWidget {
  final String id;
  final String productImage;
  final String productName;
  final double productPrice;
  const HomeProduct(
      {required this.id,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      child: GestureDetector(
        onTap: (() =>
            Navigator.pushNamed(context, 'ProductDetails', arguments: id)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(96, 214, 210, 210),
                    borderRadius: BorderRadius.circular(5)),
                height: MediaQuery.of(context).size.width * 0.44,
                width: MediaQuery.of(context).size.width * 0.44,
                child: Padding(
                  padding: EdgeInsets.all(
                    MediaQuery.of(context).size.width * 0.03,
                  ),
                  child: Image.asset(productImage),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 7),
                  child: FittedBox(
                    child: Text(productName,
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.width * 0.045)),
                  )),
              FittedBox(
                child: Text(
                  "\$ $productPrice",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.05),
                ),
              )
            ]),
      ),
    );
  }
}
