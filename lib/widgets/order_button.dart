import 'package:flutter/material.dart';

class OrderButton extends StatelessWidget {
  final Function onTap;
  final Color color;
  OrderButton(this.onTap, this.color);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
      onPressed: onTap(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.shopping_bag),
            SizedBox(width: 10),
            Text(
              'Order Now!',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
