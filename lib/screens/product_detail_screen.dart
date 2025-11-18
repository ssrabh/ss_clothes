import 'package:female_clothes/provider/product_provider.dart';
import 'package:female_clothes/widgets/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  // Removed _isLoading state and all setState calls!

  @override
  void initState() {
    super.initState();
    // Use WidgetsBinding to ensure context is fully available for navigation/dialogs
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final pp = Provider.of<ProductProvider>(context, listen: false);
      pp.loadProductById(widget.productId); // Just call the function
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, pp, _) {
      final product = pp.product;
      final isLoading = pp.isLoading; // <-- Get loading state from Provider

      // --- Loading State ---
      if (isLoading || product == null) {
        return const Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Fetching exquisite details...',
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        );
      }

      // --- Display State ---
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          title: AnimatedOpacity(
            // Use the Provider's loading state to control opacity
            opacity: isLoading ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 300),
            child: Text(
              product.name ?? 'Product Details',
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_bag_outlined)),
            const SizedBox(width: 8),
          ],
        ),
        body: ProductDetailsWidget(product: product),
      );
    });
  }
}
