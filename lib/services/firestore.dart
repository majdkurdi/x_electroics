import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:x_electronics/modals/cart_item.dart';
import '../modals/order.dart';
import '../modals/product.dart';
import '../modals/location.dart';

class FireStoreDatabase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<Product>> fetchProducts() async {
    List<Product> products = [];

    CollectionReference productsCollection = firestore.collection('products');
    final fetchedData = (await productsCollection.get()).docs;

    for (var pro in fetchedData) {
      final proData = pro.data() as Map<String, dynamic>;

      products.add(Product(
          pro.id,
          proData['name'],
          proData['price'].toDouble(),
          proData['description'],
          proData['imageUrl'],
          proData['discount'],
          proData['productType'],
          proData['top']));
    }
    print(products.length);
    print(products[0].discount);

    return products;
  }

  Future<List<Order>> fetchOrders() async {
    List<Order> orders = [];

    CollectionReference productsCollection = firestore.collection('orders');
    final fetchedData = (await productsCollection.get()).docs;

    for (var ord in fetchedData) {
      final ordData = ord.data() as Map<String, dynamic>;
      final itemsList = ordData['items'] as List<dynamic>;
      final location = ordData['location'] as Map<String, dynamic>;

      orders.add(Order(
          DateTime.parse(ordData['date']),
          itemsList
              .map((e) =>
                  CartItem(e['id'], e['name'], e['quantity'], e['price']))
              .toList(),
          ordData['total'],
          Location(location['latitude']!, location['longitude']!),
          OrderStatus.values
              .firstWhere((element) => element.toString() == ordData['status']),
          ordData['email'],
          ordData['phoneNumber'],
          ord.id));
    }
    print(orders.length);
    print(orders[0].email);
    print(orders[0].id);

    return orders;
  }

  Future addOrder(Order order) async {
    CollectionReference ordersCollection = firestore.collection('orders');
    try {
      return await ordersCollection.add({
        'date': order.date.toIso8601String(),
        'total': order.total,
        'location': {
          'latitude': order.location.latitude,
          'longitude': order.location.longitude
        },
        'status': order.status.toString(),
        'email': order.email,
        'phoneNumber': order.phoneNumber,
        'items': order.items
            .map((e) => {
                  'id': e.id,
                  'name': e.name,
                  'quantity': e.quantity,
                  'price': e.price
                })
            .toList()
      });
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
