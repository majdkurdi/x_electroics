import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Image(
              image: AssetImage('assets/logo.png'),
            ),
          ),
          DrawerListTile(Icons.mobile_friendly, 'Smart Phones'),
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
  DrawerListTile(this.icon, this.title);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(leading: Icon(icon), title: Text(title)),
        Divider(
          indent: 20,
          endIndent: 20,
        )
      ],
    );
  }
}
