enum ProductType { SmartPhone, SmartTV, AirConditioner }

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final int discount;
  final String productType;
  final bool topProd;

  Product(this.id, this.name, this.price, this.description, this.imageUrl,
      this.discount, this.productType, this.topProd);
}
