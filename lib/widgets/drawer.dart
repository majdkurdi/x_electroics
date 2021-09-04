import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/typeProducts.dart';
import '../views/home_screen.dart';
import '../views/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: Get.height / 3,
            child: Image(
              image: AssetImage('assets/logo.png'),
            ),
          ),
          DrawerListTile(Icons.home, 'Home', HomeScreen()),
          DrawerListTile(Icons.mobile_friendly, 'Smart Phone'),
          DrawerListTile(Icons.tv, 'Smart TV'),
          DrawerListTile(Icons.ac_unit, 'Air Conditioner'),
          DrawerListTile(Icons.shopping_bag, 'Orders', OrdersScreen(), false)
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? route;
  final bool replacementPush;
  DrawerListTile(this.icon, this.title,
      [this.route, this.replacementPush = true]);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              if (replacementPush)
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (ctx) => route ?? TypeProductsScreen(title)));
              else
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => route!));
            },
            child: ListTile(leading: Icon(icon), title: Text(title))),
        Divider(
          indent: 20,
          endIndent: 20,
        )
      ],
    );
  }
}
