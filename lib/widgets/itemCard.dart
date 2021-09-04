import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modals/product.dart';
import '../views/item_details.dart';

class ItemCard extends StatelessWidget {
  final Product item;
  ItemCard(this.item);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ItemDetailsScreen(item));
      },
      child: Card(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              fit: BoxFit.cover,
              height: 150,
              width: 150,
              placeholder: AssetImage('assets/logo.png'),
              image: NetworkImage(item.imageUrl),
            ),
          ),
          Column(
            children: [Text(item.name), Text('${item.price}\$')],
          ),
          TextButton(
            onPressed: () {
              Get.to(() => ItemDetailsScreen(item));
            },
            child: Text(
              'Read More',
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      )),
    );
  }
}
