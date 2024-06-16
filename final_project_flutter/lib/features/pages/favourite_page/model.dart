class Product {
  final int id;
  final String image;
  final String title;
  final String description; // Add this line
  final double price;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.description, // Add this line
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      description: json['description'], // Add this line
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'description': description, // Add this line
      'price': price,
    };
  }
}
