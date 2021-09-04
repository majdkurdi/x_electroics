import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/products_controller.dart';
import '../views/home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName = '/welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final productsController = Get.find<ProductsController>();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0)).then((value) async {
      await productsController.updateProducts();
      Get.offNamed(HomeScreen.routeName);
    });
  }

  @override
  void dispose() {
    productsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 50,
        ),
        Column(
          children: [
            Image(image: AssetImage('assets/logo.png')),
            Text(
              'All Your Devices, One Place!',
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black))
            ],
          ),
        )
      ],
    ));
  }
}
