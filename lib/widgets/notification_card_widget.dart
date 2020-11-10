import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';

import '../models/notifications_model.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key key,
    @required this.notification,
  }) : super(key: key);

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset('assets/icons/offer.svg'),
          SizedBox(width: 15.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notification.title, style: theme.textTheme.headline4),
                SizedBox(height: 15.0),
                ReadMoreText(
                  notification.description,
                  colorClickableText: theme.primaryColor,
                  style: theme.textTheme.bodyText2,
                  trimLines: 3,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '... Read more',
                  trimExpandedText: ' Less',
                ),
                SizedBox(height: 12.0),
                Text(
                  '${notification.date} ${notification.time}',
                  style: theme.textTheme.subtitle2,
                ),
                SizedBox(height: 12.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}
