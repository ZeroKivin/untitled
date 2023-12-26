import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/product.dart';

part 'product_list_state.freezed.dart';

@freezed
class ProductListState with _$ProductListState {
  const factory ProductListState.data({
    required List<Product> products,
  }) = ProductListData;

  const factory ProductListState.loading() = ProductListLoading;
}
