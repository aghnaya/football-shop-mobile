import 'package:flutter/material.dart';
import 'package:football_shop/models/product.dart';
import 'package:football_shop/models/product_service.dart';
import 'package:football_shop/widgets/product_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductListPage extends StatefulWidget {
  final bool onlyMine;

  const ProductListPage({super.key, this.onlyMine = false});

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late Future<List<Product>> _futureProducts;
  String? _username;

  @override
  void initState() {
    super.initState();
    _loadUsernameAndFetch();
  }

  void _loadUsernameAndFetch() async {
    final prefs = await SharedPreferences.getInstance();
    _username = prefs.getString('username');
    setState(() {
      _futureProducts = ProductService.fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.onlyMine ? 'My Products' : 'All Products'),
      ),
      body: FutureBuilder<List<Product>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products found'));
          }

          final products = snapshot.data!;

          final filtered = widget.onlyMine
              ? products.where((p) => p.owner != null && p.owner == _username).toList()
              : products;

          return ListView.builder(
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              return ProductCard(product: filtered[index]);
            },
          );
        },
      ),
    );
  }
}
