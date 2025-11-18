import 'package:female_clothes/data/models/product_model.dart';
import 'package:female_clothes/data/repository/mock_data.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  List<ProductModel> _items = [];
  bool _isLoading = false; // <-- NEW: State for loading

  List<ProductModel> get items => _items;
  bool get isLoading => _isLoading; // <-- NEW: Getter for loading

  void loadForCategory(String categoryId) async {
    // <-- Must be async for the delay
    _isLoading = true;
    notifyListeners(); // Notify listeners to show the loading indicator

    // Simulate network delay before fetching data
    await Future.delayed(const Duration(milliseconds: 500));

    _items =
        MockData.products.where((p) => p.categoryId == categoryId).toList();

    _isLoading = false;
    notifyListeners(); // Notify listeners to show the loaded data
  }
}
