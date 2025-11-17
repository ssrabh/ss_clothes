import 'package:female_clothes/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
    if (widget.product.colors?.isNotEmpty ?? false)
      selectedColor = widget.product.colors!.first;
    if (widget.product.sizes?.isNotEmpty ?? false)
      selectedSize = widget.product.sizes!.first;
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 700;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image carousel (simple pageview)
          SizedBox(
            height: isWide ? 420 : 320,
            child: PageView.builder(
              itemCount: p.images?.length ?? 1,
              itemBuilder: (context, i) {
                final img = p.images![i];
                return Image.network(img,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    errorBuilder: (_, __, ___) =>
                        Container(color: Colors.grey[200]));
              },
            ),
          ),

          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(p.name ?? '', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Row(children: [
                Text('₹${p.salePrice ?? p.price ?? 0}',
                    style: TextStyle(
                        fontSize: isWide ? 24 : 20,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFFF17CA3))),
                const SizedBox(width: 12),
                if (p.salePrice != null)
                  Text('₹${p.price}',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey[400])),
              ]),
              const SizedBox(height: 16),
              if (p.colors?.isNotEmpty ?? false) ...[
                Text('Colors',
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 10),
                Wrap(
                    spacing: 10,
                    children: p.colors!.map((c) {
                      final isSelected = c == selectedColor;
                      return ChoiceChip(
                          label: Text(c),
                          selected: isSelected,
                          onSelected: (_) => setState(() => selectedColor = c));
                    }).toList()),
                const SizedBox(height: 12),
              ],
              if (p.sizes?.isNotEmpty ?? false) ...[
                Text('Sizes', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 10),
                Wrap(
                    spacing: 10,
                    children: p.sizes!.map((s) {
                      final isSelected = s == selectedSize;
                      return ChoiceChip(
                          label: Text(s),
                          selected: isSelected,
                          onSelected: (_) => setState(() => selectedSize = s));
                    }).toList()),
                const SizedBox(height: 16),
              ],
              Text('Description',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text(p.description ?? '',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 24),
              Row(children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Add to Cart'))),
                const SizedBox(width: 12),
                Expanded(
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text('Buy Now'))),
              ]),
              const SizedBox(height: 30),
            ]),
          )
        ],
      ),
    ).animate().fadeIn(duration: 500.ms).moveY(begin: 30, duration: 500.ms);
  }
}
