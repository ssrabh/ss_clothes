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
  @override
  void initState() {
    super.initState();
    final pp = Provider.of<ProductProvider>(context, listen: false);
    pp.loadProductById(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, pp, _) {
      final product = pp.product;
      if (product == null)
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      return Scaffold(
        appBar: AppBar(title: Text(product.name ?? 'Product')),
        body: ProductDetailsWidget(product: product),
      );
    });
  }
}
