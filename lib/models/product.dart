import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

class Product {
  int id;
  String name;
  int price;
  String description;
  String thumbnail;
  String category;
  bool isFeatured;
  String? owner;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.thumbnail,
    required this.category,
    required this.isFeatured,
    this.owner,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    // Django serialized format: {"pk":..., "fields": { ... }}
    final fields = json["fields"] ?? {};

    // Some deployments may include direct keys instead of nested fields.
    String resolveString(String key, String fallback) {
      if (fields.containsKey(key) && fields[key] != null) return fields[key].toString();
      if (json.containsKey(key) && json[key] != null) return json[key].toString();
      return fallback;
    }

    int resolveInt(String key, int fallback) {
      final val = fields[key] ?? json[key];
      if (val == null) return fallback;
      if (val is int) return val;
      return int.tryParse(val.toString()) ?? fallback;
    }

    bool resolveBool(String key, bool fallback) {
      final val = fields[key] ?? json[key];
      if (val == null) return fallback;
      if (val is bool) return val;
      if (val is int) return val != 0;
      final s = val.toString().toLowerCase();
      return s == 'true' || s == '1';
    }

    return Product(
      id: json["pk"] ?? int.tryParse(json["id"]?.toString() ?? '') ?? 0,
      name: resolveString('name', 'No Name'),
      price: resolveInt('price', 0),
      description: resolveString('description', ''),
      thumbnail: resolveString('thumbnail', ''),
      category: resolveString('category', 'uncategorized'),
      isFeatured: resolveBool('is_featured', false),
      owner: resolveString('owner', ''),
    );
  }
}
