import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum Sort {
  descending('По убыванию'),
  ascending('По возрастанию');

  final String name;

  const Sort(this.name);
}
