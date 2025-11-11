import 'package:flutter/material.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  int _price = 0;
  String _description = "";
  String _thumbnail = "";
  String _category = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk Baru'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nama Produk",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => _name = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama tidak boleh kosong!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Harga Produk",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => _price = int.tryParse(value) ?? 0,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Harga tidak boleh kosong!";
                  }
                  if (int.tryParse(value) == null) {
                    return "Harga harus berupa angka!";
                  }
                  if (int.parse(value) <= 0) {
                    return "Harga harus lebih dari 0!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Deskripsi Produk",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onChanged: (value) => _description = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Deskripsi tidak boleh kosong!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "URL Thumbnail",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => _thumbnail = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "URL thumbnail tidak boleh kosong!";
                  }
                  if (!Uri.tryParse(value)!.isAbsolute) {
                    return "Masukkan URL yang valid!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Kategori Produk",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => _category = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Kategori tidak boleh kosong!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Produk Berhasil Disimpan!"),
                        content: Text(
                          "Nama: $_name\n"
                          "Harga: $_price\n"
                          "Deskripsi: $_description\n"
                          "URL Thumbnail: $_thumbnail\n"
                          "Kategori: $_category",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          )
                        ],
                      ),
                    );
                  }
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
