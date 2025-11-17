import 'package:female_clothes/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 700;

    return LayoutBuilder(builder: (context, constraints) {
      final w = constraints.maxWidth;
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 12, offset: Offset(0, 6))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // image
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.network(
                    product.images?.first ?? '',
                    height: isWide ? 180 : 160,
                    width: double.infinity,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Container(
                        height: 160,
                        color: Colors.grey[200],
                        child: Icon(Icons.image, size: 48)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.name ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: isWide ? 16 : 14,
                                fontWeight: FontWeight.w700)),
                        const SizedBox(height: 6),
                        Row(children: [
                          Text('₹${product.salePrice ?? product.price ?? 0}',
                              style: TextStyle(
                                  fontSize: isWide ? 16 : 14,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFF17CA3))),
                          const SizedBox(width: 8),
                          if (product.salePrice != null)
                            Text('₹${product.price}',
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey[400],
                                    fontSize: isWide ? 14 : 12)),
                        ])
                      ]),
                ),
              ],
            ),
          ),
        )
            .animate()
            .fadeIn(duration: 400.ms)
            .scale(duration: 400.ms, curve: Curves.easeOut),
      );
    });
  }
}
