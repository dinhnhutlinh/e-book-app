// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_app/models/review.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  Review review;
  RatingWidget({
    Key? key,
    required this.review,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: CachedNetworkImage(
          imageUrl: review.user?.avatar ?? '',
          height: 32,
          width: 32,
        ),
      ),
      title: Text(
        review.user?.name ?? 'User',
      ),
      subtitle: ListBody(
        children: const [],
      ),
    );
  }
}
