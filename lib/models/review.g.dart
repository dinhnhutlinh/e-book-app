// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      user: json['user'] == null
          ? null
          : UserProfile.fromJson(json['user'] as Map<String, dynamic>),
      rate: json['rate'] as int?,
      content: json['content'] as String?,
      update: json['update'] == null
          ? null
          : DateTime.parse(json['update'] as String),
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'user': instance.user?.toJson(),
      'rate': instance.rate,
      'content': instance.content,
      'update': instance.update?.toIso8601String(),
    };
