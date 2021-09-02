import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:get/get.dart';
import '../modals/product.dart';
import '../views/item_details.dart';

class MyCarouselSlider extends StatelessWidget {
  const MyCarouselSlider(this.products);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: products
          .map((e) => Builder(
              builder: (context) => GestureDetector(
                    onTap: () {
                      Get.to(() => ItemDetailsScreen(e));
                    },
                    child: FadeInImage(
                      placeholder: AssetImage('assets/logo.png'),
                      fit: BoxFit.fill,
                      image: NetworkImage(e.imageUrl),
                    ),
                  )))
          .toList(),
      options: CarouselOptions(
        height: 200,
        aspectRatio: 1 / 3,
        autoPlay: true,
        reverse: true,
      ),
    );
  }
}
