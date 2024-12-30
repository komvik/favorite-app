import 'package:favorites_app/models/favorites_provider.dart';
import 'package:favorites_app/screens/favorites_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          Consumer<FavoritesProvider>(
            builder: (context, favoritesProvider, child) {
              return IconButton(
                icon: badges.Badge(
                  badgeContent: Text(
                    favoritesProvider.favoriteCount.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  badgeStyle: const badges.BadgeStyle(
                    badgeColor: Colors.red,
                    padding: EdgeInsets.all(6),
                  ),
                  child: const Icon(
                    Icons.favorite,
                    size: 30,
                    color: Colors.black54,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavoritesScreen(),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, child) {
          return ListView.builder(
            itemCount: favoritesProvider.products.length,
            itemBuilder: (context, index) {
              final product = favoritesProvider.products[index];
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
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: product.isFavorite ? Colors.red : null,
                    ),
                    onPressed: () =>
                        favoritesProvider.toggleFavorite(product.id),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
