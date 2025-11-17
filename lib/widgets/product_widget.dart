import 'package:flutter/material.dart';
import '../data/models/product_model.dart';

// ---------------- PRODUCT CARD ----------------
class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double imageHeight = width * 1.2;
        double padding = width.clamp(8, 16);
        double titleSize = width.clamp(14, 20);
        double priceSize = width.clamp(13, 18);

        return GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    product.images![0] ?? '',
                    height: imageHeight,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  product.name ?? 'Product Name',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: titleSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "${product.price ?? 0} ₹",
                  style: TextStyle(
                    fontSize: priceSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ---------------- PRODUCT DETAIL SCREEN ----------------
class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          double imgHeight = width * 1.2;
          double padding = width.clamp(12, 24);
          double titleSize = width.clamp(22, 32);
          double priceSize = width.clamp(18, 26);
          double descSize = width.clamp(14, 18);

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      child: Image.network(
                        product.images![0] ?? '',
                        height: imgHeight,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SafeArea(
                      child: IconButton(
                        icon: Icon(Icons.arrow_back,
                            color: Colors.white, size: 28),
                        onPressed: () => Navigator.pop(context),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name ?? 'Product Name',
                        style: TextStyle(
                          fontSize: titleSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "${product.price ?? 0} ₹",
                        style: TextStyle(
                          fontSize: priceSize,
                          fontWeight: FontWeight.w700,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        product.description ?? 'No description available.',
                        style: TextStyle(
                          fontSize: descSize,
                          height: 1.4,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 30),

                      // --- Buy / Add to Cart Buttons ---
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                backgroundColor: Colors.pinkAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Add to Cart",
                                style: TextStyle(fontSize: width.clamp(14, 18)),
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                side: BorderSide(
                                    color: Colors.pinkAccent, width: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Buy Now",
                                style: TextStyle(
                                  fontSize: width.clamp(14, 18),
                                  color: Colors.pinkAccent,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
