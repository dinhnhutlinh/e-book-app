// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_app/models/review.dart';
import 'package:e_book_app/utils/custom_color.g.dart';
import 'package:flutter/material.dart';

class ReviewListTile extends StatelessWidget {
  final Review review;
  const ReviewListTile({
    Key? key,
    required this.review,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        child: ClipOval(
          child: CachedNetworkImage(
            placeholder: (context, url) => const CircularProgressIndicator(),
            imageUrl: review.userImage ?? '',
            height: 32,
            width: 32,
          ),
        ),
      ),
      title: Text(
        review.userName ?? 'User',
      ),
      subtitle: ListBody(
        children: [
          Row(
            children: [
              Text('${review.rate}'),
              const SizedBox(
                width: 16,
              ),
              const Icon(
                Icons.favorite,
                color: customcolor1,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            review.content ?? '',
          ),
        ],
      ),
    );
  }
}
