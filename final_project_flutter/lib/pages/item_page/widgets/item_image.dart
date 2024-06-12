import 'package:flutter/cupertino.dart';

class ItemImage extends StatelessWidget {
  final String imageUrl;
  const ItemImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Image.network(
        imageUrl,
        height: 300,
      ),
    );
  }
}
