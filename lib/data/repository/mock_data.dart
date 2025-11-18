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
      // NEW: Clear focus on a stylish dress
      image:
          'https://images.pexels.com/photos/10360667/pexels-photo-10360667.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: 'Trendy western & ethnic dresses.',
      isActive: true,
    ),
    Category(
      id: '2',
      name: 'Tops',
      // NEW: Focus on a chic, casual top
      image:
          'https://images.pexels.com/photos/1484831/pexels-photo-1484831.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: 'Modern stylish tops for daily & party wear.',
      isActive: true,
    ),
    Category(
      id: '3',
      name: 'Kurti',
      // NEW: Clear, vibrant shot of ethnic Kurti design
      image:
          'https://images.pexels.com/photos/4006579/pexels-photo-4006579.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: 'Latest ethnic kurtis.',
      isActive: true,
    ),
    Category(
      id: '4',
      name: 'Jeans',
      // NEW: Focus on the denim texture and fit
      image:
          'https://images.pexels.com/photos/4037146/pexels-photo-4037146.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: 'Trendy denim jeans and jeggings.',
      isActive: true,
    ),
    Category(
      id: '5',
      name: 'Saree',
      // NEW: Focus on Saree fabric and traditional elegance
      image:
          'https://images.pexels.com/photos/3482594/pexels-photo-3482594.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: 'Traditional & designer sarees.',
      isActive: true,
    ),
    Category(
      id: '6',
      name: 'Winter Wear',
      // NEW: Distinct winter jacket/coat photo
      image:
          'https://images.pexels.com/photos/7178082/pexels-photo-7178082.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
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
      name: 'Floral Summer Mini Dress',
      description:
          'Lightweight floral summer dress with premium stitching and a flattering A-line silhouette.',
      images: [
        // Primary Image: Distinct floral dress
        'https://images.pexels.com/photos/8086036/pexels-photo-8086036.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        // Secondary Image: Different view
        'https://images.pexels.com/photos/7006842/pexels-photo-7006842.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
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
      name: 'Scarlet Ruffled Gown',
      description:
          'Elegant scarlet red gown with ruffles, perfect for parties & cocktail events.',
      images: [
        // Primary Image: Clear red evening dress/gown
        'https://images.pexels.com/photos/157675/fashion-men-s-accessories-tie-business-157675.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      ],
      price: 2499,
      salePrice: 1999,
      categoryId: '1',
      categoryName: 'Dresses',
      colors: ['Red', 'Wine'],
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
      name: 'Velvet Bodycon Dress',
      description:
          'Chic and modern velvet bodycon dress with a slight sheen for evening wear.',
      images: [
        // Primary Image: Black bodycon dress
        'https://images.pexels.com/photos/977567/pexels-photo-977567.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      ],
      price: 1799,
      salePrice: null,
      categoryId: '1',
      categoryName: 'Dresses',
      colors: ['Black', 'Navy'],
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
      name: 'Ribbed Knit Crop Top',
      description:
          'Soft breathable ribbed knit crop top, perfect for layering or summer days.',
      images: [
        // Primary Image: Pink/casual top
        'https://images.pexels.com/photos/7679729/pexels-photo-7679729.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      ],
      price: 699,
      salePrice: null,
      categoryId: '2',
      categoryName: 'Tops',
      colors: ['Pink', 'White', 'Beige'],
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
      name: 'Silk Shirt Blouse',
      description:
          'Formal yet fashionable silk blouse for a sharp office look.',
      images: [
        // Primary Image: Formal blouse
        'https://images.pexels.com/photos/4037146/pexels-photo-4037146.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      ],
      price: 899,
      salePrice: 799,
      categoryId: '2',
      categoryName: 'Tops',
      colors: ['Blue', 'Black', 'White'],
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
      name: 'Emerald Green Anarkali',
      description:
          'Designer Anarkali style kurti with intricate gold embroidery.',
      images: [
        // Primary Image: Traditional Anarkali/Kurti style
        'https://images.pexels.com/photos/4006579/pexels-photo-4006579.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      ],
      price: 1499,
      salePrice: 1299,
      categoryId: '3',
      categoryName: 'Kurti',
      colors: ['Maroon', 'Green', 'Navy'],
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
      name: 'Mandarin Collar Straight Kurti',
      description:
          'Soft cotton kurti with a chic print and modern straight fit.',
      images: [
        // Primary Image: Chic printed kurti
        'https://images.pexels.com/photos/1549201/pexels-photo-1549201.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      ],
      price: 899,
      salePrice: null,
      categoryId: '3',
      categoryName: 'Kurti',
      colors: ['Blue', 'Red', 'Yellow'],
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
      name: 'High-Waist Mom Jeans',
      description:
          'Stretchable premium denim with a flattering high-rise and comfortable "mom" fit.',
      images: [
        // Primary Image: Clear mom jeans fit
        'https://images.pexels.com/photos/4037146/pexels-photo-4037146.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      ],
      price: 1599,
      salePrice: 1299,
      categoryId: '4',
      categoryName: 'Jeans',
      colors: ['Light Blue', 'Dark Blue'],
      sizes: ['28', '30', '32', '34'],
      stock: 30,
      brand: 'DenimPro',
      rating: 4.7,
      ratingCount: 210,
    ),
    ProductModel(
      id: '402',
      sku: 'JEANS-BLK-402',
      name: 'Power Stretch Black Skinny Jeans',
      description:
          'Modern, high-stretch, slim-fit black denim jeans for ultimate comfort.',
      images: [
        // Primary Image: Black skinny jeans
        'https://images.pexels.com/photos/1485609/pexels-photo-1485609.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
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
      name: 'Kanjivaram Silk Saree',
      description:
          'Handwoven silk saree with rich Zari work, perfect for weddings and festivities.',
      images: [
        // Primary Image: Focused on silk fabric and design
        'https://images.pexels.com/photos/3482594/pexels-photo-3482594.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      ],
      price: 2999,
      salePrice: 2499,
      categoryId: '5',
      categoryName: 'Saree',
      colors: ['Red', 'Maroon', 'Gold'],
      sizes: ['Free Size'],
      stock: 7,
      brand: 'SilkWeaves',
      rating: 4.9,
      ratingCount: 150,
    ),
    ProductModel(
      id: '502',
      sku: 'SAREE-COTTON-502',
      name: 'Printed Linen Cotton Saree',
      description:
          'Lightweight linen-cotton blend saree for comfortable daily and office wear.',
      images: [
        // Primary Image: Light cotton saree
        'https://images.pexels.com/photos/6311666/pexels-photo-6311666.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      ],
      price: 1999,
      salePrice: 1699,
      categoryId: '5',
      categoryName: 'Saree',
      colors: ['Yellow', 'Pink', 'Blue'],
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
      name: 'Faux Woolen Trench Coat',
      description:
          'Stylish trench coat in a woolen blend, ideal for cold weather and layering.',
      images: [
        // Primary Image: Trench coat
        'https://images.pexels.com/photos/7178082/pexels-photo-7178082.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      ],
      price: 2199,
      salePrice: 1899,
      categoryId: '6',
      categoryName: 'Winter Wear',
      colors: ['Brown', 'Black', 'Grey'],
      sizes: ['S', 'M', 'L'],
      stock: 17,
      brand: 'WinterPro',
      rating: 4.7,
      ratingCount: 130,
    ),
    ProductModel(
      id: '602',
      sku: 'HOODIE-GREY-602',
      name: 'Oversized Fleece Hoodie',
      description:
          'Ultra-soft fleece hoodie with an oversized fit, perfect for lounging.',
      images: [
        // Primary Image: Cozy hoodie
        'https://images.pexels.com/photos/7679726/pexels-photo-7679726.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      ],
      price: 1199,
      salePrice: 999,
      categoryId: '6',
      categoryName: 'Winter Wear',
      colors: ['Grey', 'Black', 'White'],
      sizes: ['S', 'M', 'L', 'XL'],
      stock: 32,
      brand: 'CozyWear',
      rating: 4.6,
      ratingCount: 165,
    ),
  ];
}
