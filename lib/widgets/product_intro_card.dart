import 'package:flutter/material.dart';
import '../data/models/product_model.dart';

class ProductIntroCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductIntroCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Card width determines text scale
        final cardWidth = constraints.maxWidth;

        // Dynamic title size using clamp
        final titleSize = cardWidth.clamp(14, 20).toDouble();

        // Dynamic price size
        final priceSize = cardWidth.clamp(12, 18).toDouble();

        return GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // IMAGE
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
                  child: AspectRatio(
                    aspectRatio: 4 / 5,
                    child: Image.network(
                      product.images?.first ?? "",
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: Colors.grey.shade200,
                        child: Icon(Icons.image_not_supported, size: 40),
                      ),
                    ),
                  ),
                ),

                // TEXT SECTION
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TITLE
                      Text(
                        product.name ?? "Product",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: titleSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),

                      // PRICE
                      Text(
                        "\$${product.salePrice ?? product.price ?? 0}",
                        style: TextStyle(
                          fontSize: priceSize,
                          color: Colors.pink.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // OPTIONAL: OLD PRICE
                      if (product.salePrice != null)
                        Text(
                          "\$${product.price}",
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                            fontSize: priceSize - 2,
                          ),
                        ),
                    ],
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
