// Statische Implementierung ohne Provider
import 'package:favorites_app/models/product.dart';
import 'package:favorites_app/screens/favorites.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final List<Product> _products = [
    Product(id: '1', name: 'Banane'),
    Product(id: '2', name: 'Apfel'),
    Product(id: '3', name: 'Erdbeere'),
    Product(id: '4', name: 'Birne'),
  ];

  void _toggleFavorite(String id) {
    setState(() {
      final product = _products.firstWhere((product) => product.id == id);
      product.isFavorite = !product.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
              size: 30,
              color: Colors.black54,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(
                    favoriteProducts: _products
                        .where((product) => product.isFavorite)
                        .toList(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: const Color.fromARGB(255, 150, 202, 228),
            child: ListTile(
              title: Text(product.name),
              trailing: IconButton(
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: product.isFavorite ? Colors.red : null,
                ),
                onPressed: () => _toggleFavorite(product.id),
              ),
            ),
          );
        },
      ),
    );
  }
}
