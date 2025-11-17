import 'package:female_clothes/data/models/product_model.dart';
import 'package:female_clothes/data/repository/mock_data.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  ProductModel? _product;

  ProductModel? get product => _product;

  void loadProductById(String id) {
    _product = MockData.products
        .firstWhere((p) => p.id == id, orElse: () => MockData.products.first);
    notifyListeners();
  }
}
