class HomepageModel {
  final int id;
  final String image;
  final String title;
  final String description;
  final double price;

  HomepageModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  factory HomepageModel.fromJson(Map<String, dynamic> json) {
    return HomepageModel(
      id: json['id'] ?? 1,
      image: json['image'] ?? '',
      title: json['title'] ?? 'Unknown',
      description: json['description'] ?? 'Unknown',
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'description': description,
      'price': price,
    };
  }
}
