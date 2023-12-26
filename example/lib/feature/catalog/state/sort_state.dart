import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/sort.dart';

part 'sort_state.freezed.dart';

@freezed
class SortState with _$SortState {
  const factory SortState.data({
    required Set<Sort> sorts,
  }) = SortData;

  const factory SortState.loading() = SortLoading;
}
