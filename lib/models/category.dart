// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_book_app/utils/date_util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  String id;
  String? name;
  @TimestampConverter()
  DateTime? updateAt;

  Category({
    required this.id,
    this.name,
    this.updateAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  Category copyWith({
    String? id,
    String? name,
    DateTime? updateAt,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      updateAt: updateAt ?? this.updateAt,
    );
  }
}
