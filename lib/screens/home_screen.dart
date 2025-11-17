import 'package:female_clothes/data/models/category_model.dart';
import 'package:female_clothes/provider/home_provider.dart';
import 'package:female_clothes/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final hp = Provider.of<HomeProvider>(context, listen: false);
    hp.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, hp, _) {
      final isTablet = MediaQuery.of(context).size.width > 700;
      final crossAxis = isTablet ? 3 : 2;

      return Scaffold(
        appBar: AppBar(
          title: const Text('Vogue Boutique'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_bag_outlined)),
          ],
        ),
        body: hp.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    _buildCategoryList(hp),
                    const SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Featured',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: hp.products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxis,
                            childAspectRatio: isTablet ? 0.78 : 0.68,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12),
                        itemBuilder: (context, index) {
                          final p = hp.products[index];
                          return ProductCard(
                              product: p,
                              // onTap: () => context
                              //     .goNamed('product', params: {'id': p.id ?? ''}),
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

  Widget _buildCategoryList(HomeProvider hp) {
    return SizedBox(
      height: MediaQuery.of(context).size.width > 700 ? 150 : 120,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: hp.categories.length,
        itemBuilder: (context, i) {
          final Category cat = hp.categories[i];
          return GestureDetector(
            // onTap: () => context.goNamed('category',
            //     params: {'id': cat.id ?? ''}, extra: {'name': cat.name}),
            onTap: () {
              context.push("/category/${cat.id}");
            },

            child: Container(
              width: MediaQuery.of(context).size.width > 700 ? 150 : 100,
              margin: const EdgeInsets.only(right: 12),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(cat.image ?? '',
                        height:
                            MediaQuery.of(context).size.width > 700 ? 110 : 70,
                        width: double.infinity,
                        fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 8),
                  Text(cat.name ?? '',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 700
                              ? 16
                              : 13)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
