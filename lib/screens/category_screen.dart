import 'package:female_clothes/provider/category_provider.dart';
import 'package:female_clothes/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryId;
  final String? categoryName;

  const CategoryScreen(
      {super.key, required this.categoryId, this.categoryName});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    final cp = Provider.of<CategoryProvider>(context, listen: false);
    cp.loadForCategory(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, cp, _) {
      final isWide = MediaQuery.of(context).size.width > 700;
      final cross = isWide ? 3 : 2;

      return Scaffold(
        appBar: AppBar(title: Text(widget.categoryName ?? 'Category')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
          child: GridView.builder(
            itemCount: cp.items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: cross,
              childAspectRatio: isWide ? 0.78 : 0.68,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, i) {
              final p = cp.items[i];
              return ProductCard(
                product: p,
                onTap: () =>
                    // context.goNamed('product', params: {'id': p.id ?? ''}),
                    context.push("/category/${p.id}"),
              );
            },
          ),
        ),
      );
    });
  }
}
