// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_book_app/models/category.dart';
import 'package:e_book_app/utils/date_util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable(explicitToJson: true)
class Book {
  String? id;
  String? name;
  int? price;
  Category? category;
  String? author;
  String? content;
  String? linkfileOnl;
  String? linkImgOnl;
  String? linkThumbnail;
  String? url;
  @TimestampConverter()
  DateTime? updateAt;
  Book({
    this.id,
    this.name,
    this.price,
    this.category,
    this.author,
    this.content,
    this.linkfileOnl,
    this.linkImgOnl,
    this.linkThumbnail,
    this.url,
    this.updateAt,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);

  @override
  String toString() {
    return 'Book(id: $id, name: $name, price: $price, category: $category, author: $author, content: $content, linkfileOnl: $linkfileOnl, linkImgOnl: $linkImgOnl, linkThumbnail: $linkThumbnail, url: $url, updateAt: $updateAt)';
  }
}
