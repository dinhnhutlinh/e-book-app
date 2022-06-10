import 'package:e_book_app/models/category.dart';
import 'package:e_book_app/utils/date_util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class Book {
  String id;
  String? name;
  int? price;
  Category? category;
  String? author;
  String? content;
  String? linkfileOnl;
  String? linkImgOnl;
  String? url;
  @TimestampConverter()
  DateTime? updateAt;
  Book({
    required this.id,
    this.name,
    this.price,
    this.category,
    this.author,
    this.content,
    this.linkfileOnl,
    this.linkImgOnl,
    this.url,
    this.updateAt,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}
