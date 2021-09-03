import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../modals/cart_item.dart';
import '../widgets/cart_item_card.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    List<CartItem> items = cartController.items;
    double total = cartController.total;
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(15),
              child: ListTile(
                leading: Icon(Icons.payment),
                title: Text(
                  'Total Amount:',
                  textAlign: TextAlign.center,
                ),
                trailing: Text('$total \$'),
              ),
            ),
            Text(
              'Your Items:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            ListView.builder(
              itemBuilder: (ctx, i) => CartItemCard(i + 1, items[i], () {
                setState(() {});
              }),
              itemCount: items.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        items.isEmpty ? Colors.grey : Colors.black)),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.shopping_bag),
                      SizedBox(width: 10),
                      Text('Order Now!')
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
