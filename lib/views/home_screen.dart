import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';

import '../controllers/products_controller.dart';
import '../modals/product.dart';
import '../widgets/drawer.dart';
import '../widgets/itemCard.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';
  final productsController = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    List<Product> products = productsController.products?.value ?? [];
    List<String> images = products.map((e) => e.imageUrl).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('X Electronics'),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: images
                  .map((e) => Builder(
                      builder: (context) => FadeInImage(
                            placeholder: AssetImage('assets/logo.png'),
                            fit: BoxFit.fill,
                            image: NetworkImage(e),
                          )))
                  .toList(),
              options: CarouselOptions(
                height: 200,
                aspectRatio: 1 / 3,
                autoPlay: true,
                reverse: true,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              indent: 20,
              endIndent: 20,
            ),
            Container(
              width: 320,
              child: Text(
                'Explore The Comfort Of Online Shopping',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            // ListView.builder(
            //   physics: NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   itemBuilder: (context, i) => ItemCard(products[i]),
            //   itemCount: products.length,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemBuilder: (context, i) => ItemCard(products[i]),
                itemCount: products.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
