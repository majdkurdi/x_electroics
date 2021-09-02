import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../controllers/products_controller.dart';
import '../modals/product.dart';
import '../widgets/cart_icon_button.dart';
import '../widgets/drawer.dart';
import '../widgets/itemCard.dart';
import '../widgets/my_carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';
  final productsController = Get.find<ProductsController>();
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    List<Product> products = productsController.products?.value ?? [];
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
          title: Text('X Electronics'),
          actions: [CartIconButton()],
        ),
        drawer: AppDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyCarouselSlider(products),
              SizedBox(
                height: 5,
              ),
              Divider(
                indent: 20,
                endIndent: 20,
              ),
              Container(
                width: 320,
                child: Text(
                  'Explore The Comfort Of Online Shopping',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemBuilder: (context, i) => ItemCard(products[i]),
                  itemCount: products.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
