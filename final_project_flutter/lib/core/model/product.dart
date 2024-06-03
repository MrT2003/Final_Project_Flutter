class Product {
  final int id;
  final String title;
  final double price;
  int quantity;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.price,
    this.quantity = 1,
    required this.image,
  });
}
