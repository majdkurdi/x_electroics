import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import './controllers/products_controller.dart';
import './controllers/cart_controller.dart';
import './controllers/orders_controller.dart';
import './views/welcome_screen.dart';
import './views/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(ProductsController());
  Get.put(CartController());
  Get.put(OrdersController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: 'TitilliumWeb',
        textTheme: TextTheme(
          headline6: TextStyle(fontFamily: 'TitilliumWeb'),
        ),
      ),
      routes: {
        WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        // ItemDetailsScreen.routeName: (ctx) => ItemDetailsScreen()
      },
      initialRoute: WelcomeScreen.routeName,
    );
  }
}
