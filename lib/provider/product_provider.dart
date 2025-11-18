import 'package:female_clothes/data/models/product_model.dart';
import 'package:female_clothes/data/repository/mock_data.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  ProductModel? _product;
  bool _isLoading = false; // <-- New state variable

  ProductModel? get product => _product;
  bool get isLoading => _isLoading; // <-- New getter

  void loadProductById(String id) {
    _isLoading = true; // Start loading
    notifyListeners();

    // Simulate async operation (like fetching from an API)
    Future.delayed(const Duration(milliseconds: 300), () {
      _product = MockData.products
          .firstWhere((p) => p.id == id, orElse: () => MockData.products.first);

      _isLoading = false; // End loading
      notifyListeners();
    });
  }
}
