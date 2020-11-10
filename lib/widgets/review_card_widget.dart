import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../helpers/colors.dart';
import '../models/review_model.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key key,
    this.review,
  }) : super(key: key);

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: theme.backgroundColor,
              backgroundImage: AssetImage(review.userImage),
            ),
            title: Text(review.username ?? "Jessica Veranda",
                style: theme.textTheme.headline4),
            subtitle: SmoothStarRating(
              color: kYellowColor,
              isReadOnly: true,
              starCount: 5,
              rating: review.rating,
              allowHalfRating: false,
              borderColor: theme.unselectedWidgetColor,
              size: 15.0,
            ),
            trailing: Text(
              timeago.format(review.createdAt),
              style: theme.textTheme.subtitle2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              review.description,
              style: theme.textTheme.subtitle2,
              textAlign: TextAlign.left,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Divider(
              color: theme.unselectedWidgetColor,
            ),
          )
        ],
      ),
    );
  }
}
