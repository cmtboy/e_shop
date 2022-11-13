import 'package:flutter/material.dart';

class HomeProduct extends StatelessWidget {
  final productImage;
  final productName;
  final productPrice;
  HomeProduct(
      {required this.productImage,
      required this.productName,
      required this.productPrice});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(96, 214, 210, 210),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                height: MediaQuery.of(context).size.width * 0.44,
                width: MediaQuery.of(context).size.width * 0.44,
                child: Padding(
                  padding: EdgeInsets.all(
                    MediaQuery.of(context).size.width * 0.03,
                  ),
                  child: productImage,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 7),
                  child: Flexible(
                    child: Text(productName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.width * 0.04)),
                  )),
              Text(
                "\$ $productPrice",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.05),
              )
            ]),
      ),
    );
  }
}
