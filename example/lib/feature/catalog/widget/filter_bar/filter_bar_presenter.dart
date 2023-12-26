import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:untitled/untitled.dart';

import '../../controller/product_list_controller.dart';
import '../../controller/sort_controller.dart';
import '../../model/sort.dart';
import '../../state/sort_state.dart';
import '../sort_bottom_sheet.dart';
import 'filter_bar.dart';

FilterBarPresenter buildFilterBarPresenter(BuildContext context) {
  return FilterBarPresenter(
    productListController: context.read<ProductListController>(),
    sortController: context.read<SortController>(),
  );
}

abstract interface class IFilterBarPresenter implements IPresenter {
  ValueNotifier<Sort?> get selectedSort;

  void openSortBottomSheet();
}

final class FilterBarPresenter extends Presenter<FilterBar>
    implements IFilterBarPresenter {
  final ProductListController _productListController;
  final SortController _sortController;

  StreamSubscription? _subscription;
  final ValueNotifier<Sort?> _selectedSort = ValueNotifier(null);

  FilterBarPresenter({
    required ProductListController productListController,
    required SortController sortController,
  })  : _productListController = productListController,
        _sortController = sortController;

  @override
  ValueNotifier<Sort?> get selectedSort => _selectedSort;

  @override
  void init() {
    _subscription = _sortController.stream.whereType<SortData>().listen((data) {
      if (_selectedSort.value == null) {
        final selectedSort = data.sorts.firstOrNull;
        _selectedSort.value = selectedSort;
        _productListController.updateProducts(sort: selectedSort);
      }
    });

    _sortController.loadSorts();
  }

  @override
  void openSortBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        final sorts = _sortController.state.mapOrNull(
          data: (state) => state.sorts,
        );

        return SortBottomSheet(
          sorts: sorts ?? {},
          onSortSelect: (sort) {
            _selectedSort.value = sort;
            _productListController.updateProducts(sort: sort);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _subscription = null;
  }
}
