import 'package:female_clothes/data/models/category_model.dart';
import 'package:female_clothes/data/models/product_model.dart';
import 'package:female_clothes/data/models/product_variant_model.dart';

class MockData {
  // ------------------------------------------------------------
  //                        CATEGORIES
  // ------------------------------------------------------------
  static List<Category> categories = [
    Category(
      id: '1',
      name: 'Dresses',
      image:
          'https://images.pexels.com/photos/2983464/pexels-photo-2983464.jpeg',
      description: 'Trendy western & ethnic dresses.',
      isActive: true,
    ),
    Category(
      id: '2',
      name: 'Tops',
      image:
          'https://images.pexels.com/photos/7679729/pexels-photo-7679729.jpeg',
      description: 'Modern stylish tops for daily & party wear.',
      isActive: true,
    ),
    Category(
      id: '3',
      name: 'Kurti',
      image:
          'https://images.pexels.com/photos/1549201/pexels-photo-1549201.jpeg',
      description: 'Latest ethnic kurtis.',
      isActive: true,
    ),
    Category(
      id: '4',
      name: 'Jeans',
      image:
          'https://images.pexels.com/photos/3214729/pexels-photo-3214729.jpeg',
      description: 'Trendy denim jeans and jeggings.',
      isActive: true,
    ),
    Category(
      id: '5',
      name: 'Saree',
      image:
          'https://images.pexels.com/photos/6311659/pexels-photo-6311659.jpeg',
      description: 'Traditional & designer sarees.',
      isActive: true,
    ),
    Category(
      id: '6',
      name: 'Winter Wear',
      image:
          'https://images.pexels.com/photos/3182369/pexels-photo-3182369.jpeg',
      description: 'Jackets, hoodies & sweaters.',
      isActive: true,
    ),
  ];

  // ------------------------------------------------------------
  //                        PRODUCTS
  // ------------------------------------------------------------
  static List<ProductModel> products = [
    // ------------------- DRESSES -------------------
    ProductModel(
      id: '101',
      sku: 'DRESS-FLORAL-101',
      name: 'Floral Summer Dress',
      description: 'Lightweight floral summer dress with premium stitching.',
      images: [
        'https://images.pexels.com/photos/2983464/pexels-photo-2983464.jpeg',
        'https://images.pexels.com/photos/248052/pexels-photo-248052.jpeg',
      ],
      price: 1299,
      salePrice: 999,
      categoryId: '1',
      categoryName: 'Dresses',
      colors: ['Yellow', 'Pink', 'Blue'],
      sizes: ['S', 'M', 'L', 'XL'],
      stock: 18,
      brand: 'FashionHub',
      isFeatured: true,
      isActive: true,
      rating: 4.6,
      ratingCount: 240,
      variants: [
        ProductVariant(color: 'Yellow', size: 'S', stock: 3),
        ProductVariant(color: 'Pink', size: 'L', stock: 2),
      ],
    ),
    ProductModel(
      id: '102',
      sku: 'DRESS-RED-102',
      name: 'Red Evening Dress',
      description: 'Elegant red gown perfect for parties & events.',
      images: [
        'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg',
      ],
      price: 2499,
      salePrice: 1999,
      categoryId: '1',
      categoryName: 'Dresses',
      colors: ['Red'],
      sizes: ['S', 'M', 'L'],
      stock: 9,
      brand: 'VogueStyle',
      isFeatured: true,
      isActive: true,
      rating: 4.7,
      ratingCount: 180,
      variants: [
        ProductVariant(color: 'Red', size: 'M', stock: 3),
      ],
    ),
    ProductModel(
      id: '103',
      sku: 'DRESS-BLACK-103',
      name: 'Black Party Dress',
      description: 'Stylish and modern black dress for evening wear.',
      images: [
        'https://images.pexels.com/photos/977567/pexels-photo-977567.jpeg',
      ],
      price: 1799,
      salePrice: null,
      categoryId: '1',
      categoryName: 'Dresses',
      colors: ['Black'],
      sizes: ['S', 'M', 'L', 'XL'],
      stock: 22,
      brand: 'GlamWear',
      isActive: true,
      rating: 4.4,
      ratingCount: 140,
    ),

    // ------------------- TOPS -------------------
    ProductModel(
      id: '201',
      sku: 'TOP-PINK-201',
      name: 'Pink Casual Top',
      description: 'Soft breathable casual top for daily wear.',
      images: [
        'https://images.pexels.com/photos/7679729/pexels-photo-7679729.jpeg',
      ],
      price: 699,
      salePrice: null,
      categoryId: '2',
      categoryName: 'Tops',
      colors: ['Pink', 'White'],
      sizes: ['S', 'M', 'L'],
      stock: 25,
      brand: 'UrbanWear',
      isActive: true,
      rating: 4.3,
      ratingCount: 110,
    ),
    ProductModel(
      id: '202',
      sku: 'TOP-BLUE-202',
      name: 'Blue Office Top',
      description: 'Formal yet fashionable top for office meetings.',
      images: [
        'https://images.pexels.com/photos/1586237/pexels-photo-1586237.jpeg',
      ],
      price: 899,
      salePrice: 799,
      categoryId: '2',
      categoryName: 'Tops',
      colors: ['Blue'],
      sizes: ['S', 'M', 'L', 'XL'],
      stock: 15,
      brand: 'OfficeWear',
      isActive: true,
      rating: 4.5,
      ratingCount: 92,
    ),

    // ------------------- KURTI -------------------
    ProductModel(
      id: '301',
      sku: 'KURTI-ROYAL-301',
      name: 'Royal Embroidered Kurti',
      description: 'Designer kurti with handcrafted embroidery.',
      images: [
        'https://images.pexels.com/photos/1549201/pexels-photo-1549201.jpeg',
      ],
      price: 1499,
      salePrice: 1299,
      categoryId: '3',
      categoryName: 'Kurti',
      colors: ['Maroon', 'Green'],
      sizes: ['M', 'L', 'XL'],
      stock: 12,
      brand: 'EthnicGlow',
      isFeatured: true,
      rating: 4.8,
      ratingCount: 320,
    ),
    ProductModel(
      id: '302',
      sku: 'KURTI-CHIC-302',
      name: 'Chic Printed Kurti',
      description: 'Soft cotton kurti with beautiful prints.',
      images: [
        'https://images.pexels.com/photos/6311659/pexels-photo-6311659.jpeg',
      ],
      price: 899,
      salePrice: null,
      categoryId: '3',
      categoryName: 'Kurti',
      colors: ['Blue', 'Black'],
      sizes: ['S', 'M', 'L', 'XL'],
      stock: 28,
      brand: 'EthnicChic',
      rating: 4.4,
      ratingCount: 140,
    ),

    // ------------------- JEANS -------------------
    ProductModel(
      id: '401',
      sku: 'JEANS-HW-401',
      name: 'High-Waist Blue Denim',
      description: 'Stretchable premium denim with a high-rise fit.',
      images: [
        'https://images.pexels.com/photos/3214729/pexels-photo-3214729.jpeg',
      ],
      price: 1599,
      salePrice: 1299,
      categoryId: '4',
      categoryName: 'Jeans',
      colors: ['Blue'],
      sizes: ['28', '30', '32', '34'],
      stock: 30,
      brand: 'DenimPro',
      rating: 4.7,
      ratingCount: 210,
    ),
    ProductModel(
      id: '402',
      sku: 'JEANS-BLK-402',
      name: 'Black Skinny Jeans',
      description: 'Modern slim-fit black denim jeans.',
      images: [
        'https://images.pexels.com/photos/1036623/pexels-photo-1036623.jpeg',
      ],
      price: 1399,
      salePrice: 1199,
      categoryId: '4',
      categoryName: 'Jeans',
      colors: ['Black'],
      sizes: ['28', '30', '32', '34', '36'],
      stock: 20,
      brand: 'DenimPro',
      rating: 4.6,
      ratingCount: 170,
    ),

    // ------------------- SAREE -------------------
    ProductModel(
      id: '501',
      sku: 'SAREE-SILK-501',
      name: 'Premium Silk Saree',
      description: 'Soft silk saree with rich colors.',
      images: [
        'https://images.pexels.com/photos/6311659/pexels-photo-6311659.jpeg',
      ],
      price: 2999,
      salePrice: 2499,
      categoryId: '5',
      categoryName: 'Saree',
      colors: ['Red', 'Green'],
      sizes: ['Free Size'],
      stock: 7,
      brand: 'SilkWeaves',
      rating: 4.9,
      ratingCount: 150,
    ),
    ProductModel(
      id: '502',
      sku: 'SAREE-COTTON-502',
      name: 'Cotton Traditional Saree',
      description: 'Lightweight cotton saree for daily wear.',
      images: [
        'https://images.pexels.com/photos/6311666/pexels-photo-6311666.jpeg',
      ],
      price: 1999,
      salePrice: 1699,
      categoryId: '5',
      categoryName: 'Saree',
      colors: ['Yellow', 'Pink'],
      sizes: ['Free Size'],
      stock: 12,
      brand: 'CottonCraft',
      rating: 4.5,
      ratingCount: 90,
    ),

    // ------------------- WINTER WEAR -------------------
    ProductModel(
      id: '601',
      sku: 'JACKET-WOOL-601',
      name: 'Woolen Winter Jacket',
      description: 'Warm premium woolen jacket for winter.',
      images: [
        'https://images.pexels.com/photos/3182369/pexels-photo-3182369.jpeg',
      ],
      price: 2199,
      salePrice: 1899,
      categoryId: '6',
      categoryName: 'Winter Wear',
      colors: ['Brown', 'Black'],
      sizes: ['S', 'M', 'L'],
      stock: 17,
      brand: 'WinterPro',
      rating: 4.7,
      ratingCount: 130,
    ),
    ProductModel(
      id: '602',
      sku: 'HOODIE-GREY-602',
      name: 'Grey Casual Hoodie',
      description: 'Soft fleece hoodie ideal for cold weather.',
      images: [
        'https://images.pexels.com/photos/7679726/pexels-photo-7679726.jpeg',
      ],
      price: 1199,
      salePrice: 999,
      categoryId: '6',
      categoryName: 'Winter Wear',
      colors: ['Grey', 'Black'],
      sizes: ['S', 'M', 'L', 'XL'],
      stock: 32,
      brand: 'CozyWear',
      rating: 4.6,
      ratingCount: 165,
    ),
  ];
}
