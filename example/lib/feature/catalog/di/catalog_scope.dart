import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/untitled.dart';

import '../api/catalog_api.dart';
import '../controller/product_list_controller.dart';
import '../controller/sort_controller.dart';

class CatalogScope extends StatelessWidget {
  final Widget child;

  const CatalogScope({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CatalogApi>(
          create: (_) => CatalogApi(),
        ),
        ControllerProvider<ProductListController>(
          create: (context) => ProductListController(
            api: context.read<CatalogApi>(),
          ),
        ),
        ControllerProvider<SortController>(
          create: (context) => SortController(
            api: context.read<CatalogApi>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
