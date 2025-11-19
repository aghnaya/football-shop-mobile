import 'package:flutter/material.dart';
import 'package:football_shop/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (product.thumbnail.isNotEmpty)
                Center(
                  child: Image.network(
                    product.thumbnail,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, size: 80),
                  ),
                ),
              const SizedBox(height: 16),
              Text('Name: ${product.name}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Price: Rp ${product.price}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('Category: ${product.category}'),
              const SizedBox(height: 8),
              Text('Featured: ${product.isFeatured ? 'Yes' : 'No'}'),
              const SizedBox(height: 8),
              Text('Owner: ${product.owner ?? '-'}'),
              const SizedBox(height: 16),
              const Text('Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(product.description),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Back to list'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
