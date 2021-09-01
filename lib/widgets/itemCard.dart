import 'package:flutter/material.dart';
import '../modals/product.dart';

class ItemCard extends StatelessWidget {
  final Product item;
  ItemCard(this.item);
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FadeInImage(
            fit: BoxFit.cover,
            height: 100,
            width: 100,
            placeholder: AssetImage('assets/logo.png'),
            image: NetworkImage(item.imageUrl),
          ),
        ),
        Column(
          children: [Text(item.name), Text('${item.price}\$')],
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Read More',
            style: TextStyle(color: Colors.grey),
          ),
        )
      ],
    ));
  }
}
