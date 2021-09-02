import 'package:flutter/material.dart';
import '../modals/product.dart';
import '../widgets/details_list_tile.dart';

class ItemDetailsScreen extends StatelessWidget {
  static const routeName = '/item_details_Screen';
  final Product item;
  ItemDetailsScreen(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/logo.png'),
            image: NetworkImage(item.imageUrl),
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              item.name,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          DetailsListTile(Icons.details, item.description),
          Row(
            children: [
              Expanded(
                child: DetailsListTile(
                  Icons.euro,
                  '${item.price}\$',
                  Text(
                    'Sale ${item.discount}%',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.shopping_cart),
                    SizedBox(width: 10),
                    Text('Add to Cart')
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
