import 'package:female_clothes/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductDetailsWidget extends StatefulWidget {
  final ProductModel product;
  const ProductDetailsWidget({super.key, required this.product});

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  String? selectedColor;
  String? selectedSize;

  @override
  void initState() {
    super.initState();
    // Initialize selected options
    if (widget.product.colors?.isNotEmpty ?? false) {
      selectedColor = widget.product.colors!.first;
    }
    if (widget.product.sizes?.isNotEmpty ?? false) {
      selectedSize = widget.product.sizes!.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    final size = MediaQuery.of(context).size;
    final isWideScreen = size.width > 900;

    // The entire content is wrapped in a responsive layout
    return SingleChildScrollView(
      child: Center(
        child: Container(
          // Max width constraint for better desktop readability
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: EdgeInsets.symmetric(
              horizontal: isWideScreen ? 32.0 : 16.0, vertical: 20),

          child: Flex(
            direction: isWideScreen ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- 1. Image Carousel (Left/Top) ---
              Expanded(
                flex: isWideScreen ? 5 : 0,
                child: _buildImageCarousel(p.images, isWideScreen),
              ),

              SizedBox(
                  width: isWideScreen ? 40 : 20, height: isWideScreen ? 0 : 20),

              // --- 2. Details & Actions (Right/Bottom) ---
              Expanded(
                flex: isWideScreen ? 4 : 0,
                child: _buildProductInfo(p, context),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.05, duration: 500.ms);
  }

  // Helper: Image Carousel
  Widget _buildImageCarousel(List<String>? images, bool isWideScreen) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 8))
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: isWideScreen ? 600 : 400,
        child: PageView.builder(
          itemCount: images?.length ?? 1,
          itemBuilder: (context, i) {
            final img = images![i];
            return CachedNetworkImage(
                imageUrl: img,
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: (context, url) => Container(
                    color: Colors.grey[100],
                    child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 2))),
                errorWidget: (context, url, error) =>
                    Container(color: Colors.grey[200]));
          },
        ),
      ),
    );
  }

  // Helper: Product Info (Name, Price, Options, Description)
  Widget _buildProductInfo(ProductModel p, BuildContext context) {
    final priceStyle = Theme.of(context).textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.w900,
          color: Theme.of(context).colorScheme.primary,
          letterSpacing: 0.5,
        );
    final sectionTitleStyle = Theme.of(context)
        .textTheme
        .titleLarge
        ?.copyWith(fontWeight: FontWeight.bold);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name & Brand (If brand existed, it would go here)
        Text(p.name ?? '', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 10),

        // Price Section
        Row(children: [
          Text('₹${p.salePrice ?? p.price ?? 0}', style: priceStyle),
          const SizedBox(width: 15),
          if (p.salePrice != null)
            Text('₹${p.price}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey[500])),
        ]),
        const SizedBox(height: 20),

        const Divider(),
        const SizedBox(height: 10),

        // Color Selection
        if (p.colors?.isNotEmpty ?? false) ...[
          Text('Color: $selectedColor', style: sectionTitleStyle),
          const SizedBox(height: 10),
          Wrap(
              spacing: 8,
              runSpacing: 8,
              children: p.colors!.map((c) {
                final isSelected = c == selectedColor;
                return GestureDetector(
                  onTap: () => setState(() => selectedColor = c),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: _colorFromString(c), // Convert string to color
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey[300]!,
                          width: isSelected ? 3 : 1.5),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.4),
                                blurRadius: 6,
                              )
                            ]
                          : null,
                    ),
                  ),
                );
              }).toList()),
          const SizedBox(height: 20),
        ],

        // Size Selection
        if (p.sizes?.isNotEmpty ?? false) ...[
          Text('Size: $selectedSize', style: sectionTitleStyle),
          const SizedBox(height: 10),
          Wrap(
              spacing: 10,
              runSpacing: 10,
              children: p.sizes!.map((s) {
                final isSelected = s == selectedSize;
                return ChoiceChip(
                  label: Text(s),
                  selected: isSelected,
                  onSelected: (_) => setState(() => selectedSize = s),
                  selectedColor: Theme.of(context)
                      .colorScheme
                      .primary, // Use primary color for selection
                  backgroundColor: Colors.grey[100],
                  labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.w600),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                );
              }).toList()),
          const SizedBox(height: 20),
        ],

        // Action Buttons
        Row(children: [
          Expanded(
              child: ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Implement Add to Cart logic
                  },
                  icon: const Icon(Icons.shopping_bag_outlined),
                  label:
                      const Text('Add to Cart', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16)))),
          const SizedBox(width: 12),
          Expanded(
              child: OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Implement Buy Now logic
                  },
                  icon: const Icon(Icons.favorite_border),
                  label: const Text('Wishlist', style: TextStyle(fontSize: 16)),
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.primary)))),
        ]),
        const SizedBox(height: 30),

        // Description
        Text('Product Details', style: sectionTitleStyle),
        const SizedBox(height: 10),
        Text(p.description ?? 'No description provided.',
            style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 20),
      ],
    );
  }

  // Simple helper function to convert string color names to actual Color objects
  Color _colorFromString(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      case 'pink':
        return Colors.pink;
      case 'yellow':
        return Colors.yellow;
      case 'purple':
        return Colors.purple;
      case 'grey':
        return Colors.grey;
      default:
        return Colors.transparent;
    }
  }
}
