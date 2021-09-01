import 'package:flutter/cupertino.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final double discount;

  Product(
      {@required this.name,
      @required this.price,
      @required this.description,
      @required this.imageUrl,
      @required this.discount});
}
