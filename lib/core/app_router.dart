import 'package:female_clothes/screens/category_screen.dart';
import 'package:female_clothes/screens/home_screen.dart';
import 'package:female_clothes/screens/product_detail_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),

      // -------- CATEGORY ROUTE --------
      GoRoute(
        path: '/category/:id',
        name: 'category',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return CategoryScreen(categoryId: id);
        },
      ),

      // -------- PRODUCT DETAILS ROUTE --------
      GoRoute(
        path: '/product/:id',
        name: 'product',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ProductDetailScreen(productId: id);
        },
      ),
    ],
  );
}


/*
when work with dio..

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: '/category/:id',
        name: 'category',
        builder: (context, state) {
          final id = state.params['id']!;
          final name = state.queryParams['name'];
          return CategoryScreen(categoryId: id, categoryName: name);
        },
      ),
      GoRoute(
        path: '/product/:id',
        name: 'product',
        builder: (context, state) {
          final id = state.params['id']!;
          return ProductDetailScreen(productId: id);
        },
      ),
    ],
  );
}

*/