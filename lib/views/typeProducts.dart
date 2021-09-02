import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../controllers/products_controller.dart';
import '../modals/product.dart';
import '../widgets/cart_icon_button.dart';
import '../widgets/drawer.dart';
import '../widgets/my_carousel_slider.dart';
import '../widgets/horizontal_item_Card.dart';

class TypeProductsScreen extends StatelessWidget {
  final productsController = Get.find<ProductsController>();
  final String prodType;
  TypeProductsScreen(this.prodType);
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> helper = {
      'Air Conditioner': productsController.airCoonditioners,
      'Smart Phone': productsController.smartPhones,
      'Smart TV': productsController.smartTVs
    };
    final List<Product> products = helper[prodType].value;
    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
          currentBackPressTime = now;
          Fluttertoast.showToast(msg: 'Double Tap to Exit!');
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('${prodType}s'),
          actions: [CartIconButton()],
        ),
        drawer: AppDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyCarouselSlider(products),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) => HorizontalItemCard(products[i]),
                itemCount: products.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
