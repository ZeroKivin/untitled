import 'dart:convert';

import '../model/product.dart';
import '../model/sort.dart';
import '../model/sort_response.dart';
import 'mock_response/mock_product_list_response.dart';
import 'mock_response/mock_sort_response.dart';

final class CatalogApi {
  final Map<Sort, int Function(Product, Product)> _compares = {
    Sort.ascending: (a, b) => a.price.compareTo(b.price),
    Sort.descending: (a, b) => b.price.compareTo(a.price),
  };

  Future<List<Product>> getMockProducts({Sort? sort}) async {
    await Future.delayed(const Duration(seconds: 1));
    final response = (jsonDecode(mockProductListResponse) as List<Object?>)
        .map(
          (product) => Product.fromJson(
            product as Map<String, Object?>,
          ),
        )
        .toList();

    if (sort != null) {
      response.sort(_compares[sort]);
    }

    return response;
  }

  Future<Set<Sort>> getMockSort() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return SortResponse.fromJson(jsonDecode(mockSortResponse)).sorts;
  }
}
