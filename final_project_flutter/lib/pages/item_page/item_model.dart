class ItemModel {
  final String image;
  final String title;
  final String description;
  final double price;

  ItemModel({
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      image: json['image'] ?? '',
      title: json['title'] ?? 'Unknown',
      description: json['description'] ?? 'Unknown',
      price: json['price'] ?? 00,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'description': description,
      'price': price,
    };
  }
}
