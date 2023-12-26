import 'package:json_annotation/json_annotation.dart';

import 'sort.dart';

part 'sort_response.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class SortResponse {
  final Set<Sort> sorts;

  const SortResponse({
    required this.sorts,
  });

  factory SortResponse.fromJson(Map<String, Object?> json) =>
      _$SortResponseFromJson(json);
}
