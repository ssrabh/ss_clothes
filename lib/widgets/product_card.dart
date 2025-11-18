import 'package:female_clothes/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    // The width check is better done inside LayoutBuilder for flexibility
    return LayoutBuilder(builder: (context, constraints) {
      final isWide = constraints.maxWidth > 300; // Check based on card width

      return Material(
        color: Colors.transparent,
        // Using a custom container color for a subtle off-white effect
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          // Added a slight elevation effect on hover/tap visual feedback
          child: Container(
            clipBehavior:
                Clip.antiAlias, // Ensures child elements respect border radius
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              // Modern, subtle box shadow
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 15,
                    offset: const Offset(0, 5))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Section
                SizedBox(
                  height: constraints.maxHeight *
                      0.7, // Image takes up 70% of the card height
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: product.images?.first ??
                        'https://via.placeholder.com/400',
                    fit: BoxFit.cover, // Use cover to fill the area better
                    placeholder: (context, url) => Container(
                        color: Colors.grey[100],
                        child: const Center(
                            child: CircularProgressIndicator(strokeWidth: 2))),
                    errorWidget: (context, url, error) => Container(
                        color: Colors.grey[200],
                        child: const Icon(Icons.image_not_supported_outlined,
                            size: 40)),
                  ),
                ),

                // Details Section
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 12.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Name (slightly muted for elegance)
                        Text(product.name ?? 'Product Name',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: isWide ? 15 : 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[700])),
                        const SizedBox(height: 4),
                        // Price Row (bold and attention-grabbing)
                        Row(children: [
                          Text('₹${product.salePrice ?? product.price ?? 0}',
                              style: TextStyle(
                                  fontSize: isWide ? 17 : 15,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary)), // Use theme color for consistency
                          const SizedBox(width: 8),
                          if (product.salePrice != null)
                            Text('₹${product.price}',
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey[400],
                                    fontSize: isWide ? 13 : 11)),
                        ]),
                      ]),
                ),
              ],
            ),
          ),
        )
            .animate()
            .fadeIn(duration: 400.ms)
            .scaleXY(delay: 100.ms, begin: 0.95, curve: Curves.easeOut),
      );
    });
  }
}
