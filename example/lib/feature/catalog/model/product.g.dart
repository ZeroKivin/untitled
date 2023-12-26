// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['image_url'] as String,
      price: json['price'] as int,
      rating: (json['rating'] as num).toDouble(),
      feedbackCount: json['feedback_count'] as int,
      oldPrice: json['old_price'] as int?,
    );
