import 'package:flutter/material.dart';
import '../data/models/product_model.dart';

class ProductDetailsSection extends StatelessWidget {
  final Product product;

  const ProductDetailsSection({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        // Responsive font sizes
        final titleSize = width.clamp(18, 30).toDouble();
        final priceSize = width.clamp(16, 26).toDouble();
        final descSize = width.clamp(13, 18).toDouble();

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TITLE
              Text(
                product.name ?? "",
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              // PRICE
              Row(
                children: [
                  Text(
                    "\$${product.salePrice ?? product.price ?? 0}",
                    style: TextStyle(
                      fontSize: priceSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink.shade600,
                    ),
                  ),
                  if (product.salePrice != null) ...[
                    const SizedBox(width: 10),
                    Text(
                      "\$${product.price}",
                      style: TextStyle(
                        fontSize: priceSize - 4,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 16),

              // RATING
              if (product.rating != null)
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    const SizedBox(width: 5),
                    Text(
                      "${product.rating}",
                      style: TextStyle(fontSize: descSize),
                    ),
                    Text(
                      " (${product.ratingCount ?? 0})",
                      style:
                          TextStyle(color: Colors.grey, fontSize: descSize - 1),
                    ),
                  ],
                ),

              const SizedBox(height: 20),

              // COLORS
              if (product.colors != null && product.colors!.isNotEmpty) ...[
                Text(
                  "Available Colors",
                  style: TextStyle(
                      fontSize: descSize, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  children:
                      product.colors!.map((c) => Chip(label: Text(c))).toList(),
                ),
                const SizedBox(height: 20),
              ],

              // SIZES
              if (product.sizes != null && product.sizes!.isNotEmpty) ...[
                Text(
                  "Available Sizes",
                  style: TextStyle(
                      fontSize: descSize, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  children: product.sizes!
                      .map((s) => Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(s),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 20),
              ],

              // DESCRIPTION
              Text(
                "Description",
                style:
                    TextStyle(fontSize: descSize, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Text(
                product.description ?? "",
                style: TextStyle(fontSize: descSize),
              ),
            ],
          ),
        );
      },
    );
  }
}
