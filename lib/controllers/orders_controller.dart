import 'package:get/get.dart';
import '../modals/location.dart';
import '../modals/order.dart';
import '../modals/cart_item.dart';
import '../services/firestore.dart';

class OrdersController extends GetxController {
  final orders = <Order>[].obs;
  final firestore = FireStoreDatabase();

  Future updateOrders() async {
    orders.value = await firestore.fetchOrders();
  }

  Future addOrder(DateTime date, double total, List<CartItem> items,
      Location location, String email, int phoneNumber) async {
    final newOrder = Order(
        date, items, total, location, OrderStatus.pending, email, phoneNumber);
    final response = await firestore.addOrder(newOrder);
    if (response != null) {
      return 'done';
    }
  }
}
