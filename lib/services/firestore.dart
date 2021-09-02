import 'package:cloud_firestore/cloud_firestore.dart';
import '../modals/product.dart';

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
}
