import 'package:female_clothes/data/models/product_model.dart';
import 'package:female_clothes/data/repository/mock_data.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<ProductModel> _products = [];
  List categories = [];

  bool get isLoading => _isLoading;
  List<ProductModel> get products => _products;

  Future<void> loadData() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 450));
    _products = MockData.products;
    categories = MockData.categories;

    _isLoading = false;
    notifyListeners();
  }
}
