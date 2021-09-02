import 'package:get/get.dart';
import '../modals/cart_item.dart';

class CartController extends GetxController {
  final items = <CartItem>[].obs;

  void addToCart(CartItem item) {
    final ids = items.map((element) => element.id).toList();
    if (!ids.contains(item.id)) {
      items.add(item);
    } else {
      items.firstWhere((element) => element.id == item.id).quantity++;
    }
  }

  void removeFromCart(CartItem item) {
    final ids = items.map((element) => element.id).toList();
    if (ids.contains(item.id) &&
        items.firstWhere((element) => element.id == item.id).quantity > 1) {
      items.firstWhere((element) => element.id == item.id).quantity--;
    } else {
      items.removeWhere((element) => element.id == item.id);
    }
  }
}
