import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/cart_screen.dart';

class CartIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.shopping_cart),
        onPressed: () {
          Get.to(() => CartScreen());
        });
  }
}
