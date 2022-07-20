// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      userId: json['userId'] as String?,
      userName: json['userName'] as String?,
      userImage: json['userImage'] as String?,
      rate: json['rate'] as int?,
      content: json['content'] as String?,
      update: json['update'] == null
          ? null
          : DateTime.parse(json['update'] as String),
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'userImage': instance.userImage,
      'rate': instance.rate,
      'content': instance.content,
      'update': instance.update?.toIso8601String(),
    };
