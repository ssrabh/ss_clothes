import 'package:female_clothes/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:female_clothes/data/models/category_model.dart';
import 'package:female_clothes/data/repository/mock_data.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final filteredProducts =
        MockData.products.where((p) => p.categoryId == category.id).toList();

    return Scaffold(
      appBar: AppBar(title: Text(category.name ?? "")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -------- CATEGORY BANNER --------
          if (category.image != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.network(
                category.image!,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "${category.name} Collection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),

          // -------- PRODUCT GRID --------
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: filteredProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .68,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                final p = filteredProducts[index];
                return ProductCard(
                  product: p,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailScreen(product: p),
                        ));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
