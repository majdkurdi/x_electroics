import 'package:get/get.dart';
import '../modals/product.dart';
import '../services/firestore.dart';

class ProductsController extends GetxController {
  FireStoreDatabase firestore = FireStoreDatabase();

  RxList<Product>? products;
  RxList<Product>? topProducts;
  RxList<Product>? smartPhones;
  RxList<Product>? smartTVs;
  RxList<Product>? airCoonditioners;

  Future<void> updateProducts() async {
    final allProducts = (await firestore.fetchProducts());
    products = allProducts.obs;
    topProducts = allProducts.where((element) => element.topProd).toList().obs;
    smartPhones = allProducts
        .where((element) => element.productType == 'Smart Phone')
        .toList()
        .obs;
    smartTVs = allProducts
        .where((element) => element.productType == 'Smart TV')
        .toList()
        .obs;
    airCoonditioners = allProducts
        .where((element) => element.productType == 'Air Conditioner')
        .toList()
        .obs;
  }
}
