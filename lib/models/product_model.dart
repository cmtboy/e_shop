class Product {
  final String id;
  final String name;
  final String productDetails;
  final double price;
  final String imgUrl;
  bool isFavourite;
  Product(
      {required this.id,
      required this.name,
      required this.productDetails,
      required this.price,
      required this.imgUrl,
      this.isFavourite = false});
}
