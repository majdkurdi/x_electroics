import 'package:flutter/material.dart';

class DetailsListTile extends StatelessWidget {
  final String content;
  final IconData icon;
  final Widget? tail;
  DetailsListTile(this.icon, this.content, [this.tail]);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(content),
        trailing: tail,
      ),
    );
  }
}
