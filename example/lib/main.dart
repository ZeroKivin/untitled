import 'asset/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'asset/theme/theme_mode_holder.dart';
import 'feature/catalog/di/catalog_scope.dart';
import 'feature/catalog/page/product_list_page/product_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeModeHolder>(
      create: (_) => ThemeModeHolder(
        themeMode: ThemeMode.system,
      ),
      builder: (context, child) => MaterialApp(
        theme: AppTheme.light().themeData,
        darkTheme: AppTheme.dark().themeData,
        themeMode: context.read<ThemeModeHolder>().themeMode,
        home: child,
      ),
      child: const CatalogScope(
        child: ProductListPage(),
      ),
    );
  }
}
