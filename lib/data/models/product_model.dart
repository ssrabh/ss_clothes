import 'package:female_clothes/data/models/product_variant_model.dart';

class Product {
  final String? id;
  final String? sku;
  final String? name;
  final String? description;
  final List<String>? images;

  final double? price;
  final double? salePrice;

  final String? categoryId;
  final String? categoryName;

  final List<String>? colors;
  final List<String>? sizes;

  final int? stock;
  final double? rating;
  final int? ratingCount;
  final String? brand;

  final bool? isFeatured;
  final bool? isActive;

  final List<ProductVariant>? variants;

  final Map<String, dynamic>? meta;
  final DateTime? createdAt;

  Product({
    this.id,
    this.sku,
    this.name,
    this.description,
    this.images,
    this.price,
    this.salePrice,
    this.categoryId,
    this.categoryName,
    this.colors,
    this.sizes,
    this.stock,
    this.rating,
    this.ratingCount,
    this.brand,
    this.isFeatured,
    this.isActive,
    this.variants,
    this.meta,
    this.createdAt,
  });
}
