import 'package:female_clothes/data/models/product_model.dart';
import 'package:female_clothes/data/repository/mock_data.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  List<ProductModel> _items = [];

  List<ProductModel> get items => _items;

  void loadForCategory(String categoryId) {
    _items =
        MockData.products.where((p) => p.categoryId == categoryId).toList();
    notifyListeners();
  }
}
