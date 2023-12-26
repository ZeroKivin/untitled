import 'dart:async';
import 'dart:developer';

import 'package:untitled/untitled.dart';

import '../api/catalog_api.dart';
import '../state/sort_state.dart';

final class SortController extends Controller<SortState>
    with RestartableConcurrency {
  final CatalogApi _api;

  SortController({
    required CatalogApi api,
  })  : _api = api,
        super(
          initialState: const SortState.loading(),
        );

  void loadSorts() => handle(
        whileHandleState: const SortState.loading(),
        handler: (_) async {
          final response = await _api.getMockSort();

          return SortState.data(
            sorts: response,
          );
        },
      );

  @override
  FutureOr<void> onHandleError(Object error, StackTrace stackTrace) {
    log(error.toString(), stackTrace: stackTrace);
  }
}
