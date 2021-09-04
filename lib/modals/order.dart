import './cart_item.dart';
import './location.dart';

enum OrderStatus { pending, onWay, delivered, canceled }

class Order {
  final String? id;
  final DateTime date;
  final List<CartItem> items;
  final double total;
  final Location location;
  OrderStatus status;
  final String email;
  final int phoneNumber;

  Order(this.date, this.items, this.total, this.location, this.status,
      this.email, this.phoneNumber,
      [this.id]);
}
