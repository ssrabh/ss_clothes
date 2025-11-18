import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  double minPrice = 0;
  double maxPrice = 5000;

  String? selectedSize;
  String? selectedColor;

  double? minHeight;
  double? maxHeight;

  /// Updates the selected price range and notifies listeners.
  void updatePriceRange(double min, double max) {
    minPrice = min;
    maxPrice = max;
    notifyListeners();
  }

  /// Sets the selected size and notifies listeners.
  void setSize(String? size) {
    selectedSize = size;
    notifyListeners();
  }

  /// Sets the selected color and notifies listeners.
  void setColor(String? color) {
    selectedColor = color;
    notifyListeners();
  }

  /// Updates the minimum and maximum height values and notifies listeners.
  void updateHeight(double? min, double? max) {
    minHeight = min;
    maxHeight = max;
    notifyListeners();
  }

  /// Resets all filters to their default values and notifies listeners.
  void resetFilters() {
    minPrice = 0;
    maxPrice = 5000;
    selectedSize = null;
    selectedColor = null;
    minHeight = null;
    maxHeight = null;
    notifyListeners();
  }
}
