import 'package:get/get.dart';
import '../modals/cart_item.dart';
import '../modals/product.dart';

class CartController extends GetxController {
  final items = <CartItem>[].obs;

  void addToCart(Product item) {
    final ids = items.map((element) => element.id).toList();
    if (!ids.contains(item.id)) {
      items.add(CartItem(item.id, item.name, 1, item.price));
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

  double get total {
    if (items.isEmpty) return 0.0;
    final prices =
        items.map((element) => element.price * element.quantity).toList();
    double totaal = 0.0;
    for (var x in prices) totaal += x;
    return totaal;
  }
}
