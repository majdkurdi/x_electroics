import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modals/product.dart';
import '../views/item_details.dart';

class HorizontalItemCard extends StatelessWidget {
  final Product item;
  HorizontalItemCard(this.item);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Card(
          child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                fit: BoxFit.contain,
                height: 100,
                width: 100,
                placeholder: AssetImage('assets/logo.png'),
                image: NetworkImage(item.imageUrl),
              ),
            ),
          ),
          Container(
            width: 150,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      item.name,
                      textAlign: TextAlign.center,
                    ),
                    Text('${item.price}\$')
                  ],
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
            ),
          ),
        ],
      )),
    );
  }
}
