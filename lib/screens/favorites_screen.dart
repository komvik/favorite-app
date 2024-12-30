import 'package:favorites_app/models/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, child) {
          final favoriteProducts = favoritesProvider.favoriteProducts;
          return favoriteProducts.isEmpty
              ? const Center(
                  child: Text('No favorites yet!'),
                )
              : ListView.builder(
                  itemCount: favoriteProducts.length,
                  itemBuilder: (context, index) {
                    final product = favoriteProducts[index];
                    return ListTile(
                      title: Text(product.name),
                    );
                  },
                );
        },
      ),
    );
  }
}
