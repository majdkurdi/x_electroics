import 'dart:ffi';

import 'package:get/get.dart';
import '../modals/product.dart';
import '../services/firestore.dart';

class ProductsController extends GetxController {
  FireStoreDatabase firestore = FireStoreDatabase();

  RxList<Product>? products;

  Future<void> updateProducts() async {
    products = (await firestore.fetchProducts()).obs;
  }
}
