import 'package:female_clothes/core/app_router.dart';
import 'package:female_clothes/core/app_theme.dart';
import 'package:female_clothes/provider/category_provider.dart';
import 'package:female_clothes/provider/filter_provider.dart';
import 'package:female_clothes/provider/home_provider.dart';
import 'package:female_clothes/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => FilterProvider()),
      ],
      child: Builder(builder: (context) {
        final router = AppRouter.router;
        return MaterialApp.router(
          title: 'Female Clothes',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routerConfig: router,
        );
      }),
    );
  }
}
