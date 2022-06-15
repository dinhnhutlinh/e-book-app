// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      id: json['id'] as String?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      author: json['author'] as String?,
      content: json['content'] as String?,
      linkfileOnl: json['linkfileOnl'] as String?,
      linkImgOnl: json['linkImgOnl'] as String?,
      linkThumbnail: json['linkThumbnail'] as String?,
      url: json['url'] as String?,
      updateAt: json['updateAt'] == null
          ? null
          : DateTime.parse(json['updateAt'] as String),
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'category': instance.category?.toJson(),
      'author': instance.author,
      'content': instance.content,
      'linkfileOnl': instance.linkfileOnl,
      'linkImgOnl': instance.linkImgOnl,
      'linkThumbnail': instance.linkThumbnail,
      'url': instance.url,
      'updateAt': instance.updateAt?.toIso8601String(),
    };
