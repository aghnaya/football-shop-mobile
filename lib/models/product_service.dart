import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:football_shop/models/product.dart';

class ProductService {
  static Future<List<Product>> fetchProducts({String baseUrl = "https://aghnaya-kenarantanov-footballshop.pbp.cs.ui.ac.id"}) async {
    final url = Uri.parse("$baseUrl/items/json/");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      // If backend returns {"items": [...]}
      if (body is Map && body.containsKey('items')) {
        return (body['items'] as List).map((e) => Product.fromJson(e)).toList();
      }

      // If backend returns Django serialized list: [{"pk":..., "fields": {...}}, ...]
      if (body is List) {
        return body.map((e) => Product.fromJson(e)).toList();
      }

      throw Exception("Unexpected JSON format");
    } else {
      throw Exception("Failed to load products: ${response.statusCode}");
    }
  }
}
