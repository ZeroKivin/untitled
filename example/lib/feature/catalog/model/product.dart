import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@Freezed(
  toJson: false,
)
class Product with _$Product {
  @JsonSerializable(
    includeIfNull: false,
    fieldRename: FieldRename.snake,
    createToJson: false,
  )
  const factory Product({
    required int id,
    required String name,
    required String imageUrl,
    required int price,
    required double rating,
    required int feedbackCount,
    int? oldPrice,
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);
}
