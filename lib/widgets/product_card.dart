import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final int price;
  final String thumbnail;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.thumbnail,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            thumbnail,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.image),
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text("Rp $price"),
      ),
    );
  }
}
