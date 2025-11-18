import 'package:female_clothes/provider/category_provider.dart';
import 'package:female_clothes/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

const String _filterRoute = '/filters';

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
    // Use post-frame callback to ensure context is ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // **Only** call the load method on the provider, letting the provider manage the loading state internally.
      final cp = Provider.of<CategoryProvider>(context, listen: false);
      cp.loadForCategory(widget.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, cp, _) {
      final size = MediaQuery.of(context).size;
      final isWide = size.width > 900;
      final cross = isWide ? 4 : (size.width > 700 ? 3 : 2);

      final items = cp.items;
      final isLoading =
          cp.isLoading; // <-- Now reading loading state from Provider

      // --- 1. Loading State ---
      if (isLoading) {
        return Scaffold(
          appBar: AppBar(title: Text(widget.categoryName ?? 'Category')),
          body: const Center(child: CircularProgressIndicator()),
        );
      }

      // --- 2. Main Display ---
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          title: Text(widget.categoryName?.toUpperCase() ?? 'CATEGORY',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w900, letterSpacing: 1.5)),
          centerTitle: false,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            const SizedBox(width: 8),
          ],
        ),
        body: Column(
          children: [
            // --- Header with Item Count and Filter/Sort Action ---
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 8, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${items.length} ${items.length == 1 ? 'Item' : 'Items'}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey[700], fontWeight: FontWeight.w500),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      context.push(_filterRoute);
                    },
                    icon: const Icon(Icons.tune_rounded, size: 18),
                    label: const Text('Filter & Sort'),
                    style: OutlinedButton.styleFrom(
                        foregroundColor:
                            Theme.of(context).colorScheme.onSurface,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        side: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.5)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8)),
                  ),
                ],
              ),
            ),

            // --- Content: Grid or Empty State ---
            Expanded(
              child: items.isEmpty
                  ? _buildEmptyState(context, widget.categoryName)
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: GridView.builder(
                        itemCount: items.length,
                        padding: const EdgeInsets.only(top: 8, bottom: 30),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: cross,
                          childAspectRatio: isWide ? 0.70 : 0.65,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemBuilder: (context, i) {
                          final p = items[i];
                          return ProductCard(
                            product: p,
                            onTap: () => context.push("/product/${p.id}"),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      );
    });
  }

  // Helper for the empty state (same as before)
  Widget _buildEmptyState(BuildContext context, String? categoryName) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.category_outlined, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            'Oops! Nothing in ${categoryName ?? 'this category'} yet.',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Check back soon for new arrivals!',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => context.go('/'),
            child: const Text('Go back to Home'),
          ),
        ],
      ),
    );
  }
}
