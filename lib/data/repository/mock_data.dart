import 'package:female_clothes/data/models/product_model.dart';

import '../models/category_model.dart';

import '../models/product_variant_model.dart';

class MockData {
  // CATEGORY LIST
  static List<Category> categories = [
    Category(
      id: "1",
      name: "Dresses",
      image:
          "https://images.pexels.com/photos/1755385/pexels-photo-1755385.jpeg",
      description: "Latest trendy dresses for all occasions.",
      isActive: true,
    ),
    Category(
      id: "2",
      name: "Tops",
      image:
          "https://images.pexels.com/photos/1755385/pexels-photo-1755385.jpeg",
      description: "Modern and stylish tops for casual & party wear.",
      isActive: true,
    ),
    Category(
      id: "3",
      name: "Kurti",
      image:
          "https://images.pexels.com/photos/1755385/pexels-photo-1755385.jpeg",
      description: "Traditional and modern kurtis collection.",
      isActive: true,
    ),
  ];

  // PRODUCT LIST
  static List<ProductModel> products = [
    ProductModel(
      id: "101",
      sku: "DRESS-RED-101",
      name: "Red Summer Dress",
      description:
          "Beautiful red dress perfect for summer outings. Soft fabric and premium stitching.",
      images: [
        "https://images.pexels.com/photos/1755385/pexels-photo-1755385.jpeg",
        "https://images.pexels.com/photos/1755385/pexels-photo-1755385.jpeg"
      ],
      price: 59.99,
      salePrice: 49.99,
      categoryId: "1",
      categoryName: "Dresses",
      colors: ["Red", "Blue", "Black"],
      sizes: ["S", "M", "L", "XL"],
      stock: 15,
      brand: "FashionHub",
      isFeatured: true,
      isActive: true,
      rating: 4.5,
      ratingCount: 120,
      createdAt: DateTime.now(),
      variants: [
        ProductVariant(color: "Red", size: "S", stock: 3),
        ProductVariant(color: "Red", size: "M", stock: 4),
        ProductVariant(color: "Red", size: "L", stock: 5),
        ProductVariant(color: "Blue", size: "S", stock: 2),
      ],
    ),
    ProductModel(
      id: "102",
      sku: "TOP-PINK-102",
      name: "Pink Stylish Top",
      description: "Trendy and comfortable top suitable for all seasons.",
      images: [
        "https://images.pexels.com/photos/1755385/pexels-photo-1755385.jpeg",
      ],
      price: 29.99,
      salePrice: null,
      categoryId: "2",
      categoryName: "Tops",
      colors: ["Pink", "White"],
      sizes: ["S", "M", "L"],
      stock: 20,
      brand: "TrendyWear",
      isFeatured: false,
      isActive: true,
      rating: 4.2,
      ratingCount: 90,
      createdAt: DateTime.now(),
      variants: [
        ProductVariant(color: "Pink", size: "M", stock: 5),
        ProductVariant(color: "White", size: "L", stock: 3),
      ],
    ),
    ProductModel(
      id: "103",
      sku: "KURTI-103",
      name: "Designer Kurti",
      description:
          "Elegant kurti with handcrafted embroidery suitable for festive wear.",
      images: [
        "https://images.pexels.com/photos/1755385/pexels-photo-1755385.jpeg",
        "https://images.pexels.com/photos/1755385/pexels-photo-1755385.jpeg"
      ],
      price: 49.99,
      salePrice: 39.99,
      categoryId: "3",
      categoryName: "Kurti",
      colors: ["Yellow", "Green"],
      sizes: ["M", "L", "XL"],
      stock: 10,
      brand: "EthnicStyle",
      isFeatured: true,
      isActive: true,
      rating: 4.8,
      ratingCount: 75,
      createdAt: DateTime.now(),
      variants: [
        ProductVariant(color: "Yellow", size: "M", stock: 2),
        ProductVariant(color: "Green", size: "XL", stock: 1),
      ],
    ),
  ];
}
