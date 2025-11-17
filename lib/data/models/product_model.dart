import 'package:female_clothes/data/models/product_variant_model.dart';

class ProductModel {
  String? id;
  String? sku;
  String? name;
  String? description;
  List<String>? images;

  double? price;
  double? salePrice;

  String? categoryId;
  String? categoryName;

  List<String>? colors;
  List<String>? sizes;

  int? stock;
  double? rating;
  int? ratingCount;
  String? brand;

  bool? isFeatured;
  bool? isActive;

  List<ProductVariant>? variants;

  Map<String, dynamic>? meta;
  DateTime? createdAt;

  ProductModel({
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
