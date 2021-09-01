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

      products.add(Product(proData['name'], proData['price'].toDouble(),
          proData['description'], proData['imageUrl'], proData['discount']));
    }
    print(products.length);
    print(products[0].discount);

    return products;
  }
}
