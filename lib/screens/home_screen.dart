import 'package:female_clothes/data/models/category_model.dart';
import 'package:female_clothes/provider/home_provider.dart';
import 'package:female_clothes/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// Assuming you have a route for filters, e.g., '/filters'
const String _filterRoute = '/filters';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Load data only if it hasn't been loaded or is empty
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final hp = Provider.of<HomeProvider>(context, listen: false);
      if (hp.products.isEmpty && !hp.isLoading) {
        hp.loadData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, hp, _) {
      final size = MediaQuery.of(context).size;
      final isTablet = size.width > 700;
      final crossAxis = isTablet ? 3 : 2;
      final titleStyle = Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1.2);

      return Scaffold(
        extendBodyBehindAppBar: true, // For a cleaner look
        appBar: AppBar(
          // Elevated/Floating App Bar for modern look
          backgroundColor:
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
          elevation: 4.0,
          shadowColor: Colors.black.withOpacity(0.2),
          title: Text(
            'VOGUE BOUTIQUE',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.0,
                  color: Theme.of(context)
                      .colorScheme
                      .primary, // Using primary color for brand
                ),
          ),
          centerTitle: false,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.search, size: 28)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_bag_outlined, size: 28)),
            const SizedBox(width: 8),
          ],
        ),
        body: hp.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- 1. Hero Banner Section ---
                    _buildHeroBanner(size),

                    const SizedBox(height: 24),

                    // --- 2. Category List Section ---
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Shop By Style', style: titleStyle),
                    ),
                    const SizedBox(height: 12),
                    _buildCategoryList(hp, isTablet),

                    const SizedBox(height: 30),

                    // --- 3. Featured Products Header (Filter/Sort) ---
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Featured Picks', style: titleStyle),
                          // New Filter Button
                          OutlinedButton.icon(
                            onPressed: () {
                              context.push(
                                  _filterRoute); // Navigate to filter screen
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
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // --- 4. Product Grid Section ---
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: hp.products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxis,
                            // Adjusted aspect ratio for better product card display
                            childAspectRatio: isTablet ? 0.70 : 0.65,
                            crossAxisSpacing: 16, // Increased spacing
                            mainAxisSpacing: 16), // Increased spacing
                        itemBuilder: (context, index) {
                          final p = hp.products[index];
                          return ProductCard(
                              product: p,
                              onTap: () {
                                context.push("/product/${p.id}");
                              });
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
      );
    });
  }

  // New Hero Banner Widget
  Widget _buildHeroBanner(Size size) {
    return Container(
      // Ensure the banner is below the AppBar
      margin: EdgeInsets.only(
          top: AppBar().preferredSize.height + size.width * 0.05),
      height: size.height * 0.25, // Responsive height
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15.0),
        // A subtle, modern gradient can be used instead of solid color:
        /*
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.1),
            Theme.of(context).colorScheme.secondary.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        */
      ),
      child: Stack(
        children: [
          // Use a placeholder image or a Lottie animation here
          //
          Positioned.fill(
            child: Center(
              child: Text(
                'New Arrivals: Up to 50% Off!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.primary,
                    letterSpacing: 1.5,
                    shadows: [
                      Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(3, 3))
                    ]),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: TextButton(
              onPressed: () {},
              child: Text('Shop Now',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline)),
            ),
          )
        ],
      ),
    );
  }

  // Updated Category List Widget
  Widget _buildCategoryList(HomeProvider hp, bool isTablet) {
    final itemSize = isTablet ? 150.0 : 100.0;
    final imageSize = itemSize - 20;

    return SizedBox(
      height: itemSize + 40, // Height accommodates image + spacing + text
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: hp.categories.length,
        itemBuilder: (context, i) {
          final cat = hp.categories[i]; // Assuming cat is Category type
          return GestureDetector(
            onTap: () {
              context.push("/category/${cat.id}");
            },
            child: Container(
              width: itemSize,
              margin: const EdgeInsets.only(right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Modern Category Card Look
                  Container(
                    width: imageSize,
                    height: imageSize,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceVariant
                          .withOpacity(0.6),
                      borderRadius: BorderRadius.circular(
                          100), // Circular for a unique look
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: ClipOval(
                      child: Image.network(
                        cat.image ??
                            'https://via.placeholder.com/150', // Placeholder
                        width: imageSize,
                        height: imageSize,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                                child: Icon(Icons.camera_alt_outlined)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    cat.name ?? 'Category',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: isTablet ? 15 : 13,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
