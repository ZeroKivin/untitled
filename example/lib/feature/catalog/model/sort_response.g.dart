// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SortResponse _$SortResponseFromJson(Map<String, dynamic> json) => SortResponse(
      sorts: (json['sorts'] as List<dynamic>)
          .map((e) => $enumDecode(_$SortEnumMap, e))
          .toSet(),
    );

const _$SortEnumMap = {
  Sort.descending: 'descending',
  Sort.ascending: 'ascending',
};
