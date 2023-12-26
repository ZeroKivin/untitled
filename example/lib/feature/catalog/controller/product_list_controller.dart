import 'dart:async';
import 'dart:developer';

import 'package:untitled/untitled.dart';

import '../api/catalog_api.dart';
import '../model/sort.dart';
import '../state/product_list_state.dart';

final class ProductListController extends Controller<ProductListState>
    with RestartableConcurrency {
  final CatalogApi _api;

  ProductListController({
    required CatalogApi api,
  })  : _api = api,
        super(
          initialState: const ProductListState.loading(),
        );

  void updateProducts({Sort? sort}) => handle(
        whileHandleState: const ProductListState.loading(),
        handler: (_) async => ProductListState.data(
          products: await _api.getMockProducts(sort: sort),
        ),
      );

  @override
  FutureOr<void> onHandleError(Object error, StackTrace stackTrace) {
    log(error.toString(), stackTrace: stackTrace);
  }
}
