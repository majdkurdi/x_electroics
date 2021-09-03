import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/typeProducts.dart';
import '../views/home_screen.dart';

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
          DrawerListTile(Icons.ac_unit, 'Air Conditioner')
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? route;
  DrawerListTile(this.icon, this.title, [this.route]);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (ctx) => route ?? TypeProductsScreen(title)));
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
