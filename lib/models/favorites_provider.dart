import 'package:flutter/material.dart';
import 'product.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(id: '1', name: 'Banane'),
    Product(id: '2', name: 'Apfel'),
    Product(id: '3', name: 'Erdbeere'),
    Product(id: '4', name: 'Birne'),
  ];

  List<Product> get products => _products;

  void toggleFavorite(String id) {
    final product = _products.firstWhere((product) => product.id == id);
    product.isFavorite = !product.isFavorite;
    notifyListeners();
  }

  List<Product> get favoriteProducts =>
      _products.where((product) => product.isFavorite).toList();

  int get favoriteCount =>
      _products.where((product) => product.isFavorite).length;
}
