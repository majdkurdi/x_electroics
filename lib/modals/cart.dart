import './cart_item.dart';

class Cart {
  final List<CartItem> items;
  final double total;

  Cart(this.items, this.total);
}
