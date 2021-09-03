import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../modals/cart_item.dart';

class CartItemCard extends StatelessWidget {
  final int index;
  final CartItem item;
  final Function function;
  CartItemCard(this.index, this.item, this.function);
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: GlobalKey(),
      onDismissed: (_) {
        cartController.removeFromCart(item);
        function();
      },
      direction: DismissDirection.endToStart,
      child: Card(
        child: ListTile(
          leading: Text('$index',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          title: Text(item.name),
          trailing: Text('${item.price}\$   X${item.quantity}'),
        ),
      ),
    );
  }
}
