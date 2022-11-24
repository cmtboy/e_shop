import 'package:flutter/material.dart';

class ManageProductWidget extends StatelessWidget {
  const ManageProductWidget(
      {required this.imageUrl, required this.productName, Key? key})
      : super(key: key);

  final String imageUrl;
  final String productName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imageUrl),
      ),
      title: Text(productName),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'EditProductScreen');
              },
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
