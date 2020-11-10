import 'package:flutter/material.dart';

import '../models/notifications_model.dart';
import '../widgets/notification_card_widget.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool _isShowNotificationList = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Notifications', style: theme.textTheme.headline3),
        centerTitle: true,
      ),
      body: _isShowNotificationList
          ? Container(
              child: ListView.builder(
                itemCount: notificationList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
                itemBuilder: (context, index) {
                  var notification = notificationList[index];
                  return NotificationCard(notification: notification);
                },
              ),
            )
          : Column(
              children: [
                Image.asset('assets/images/illustrations/3.png'),
                Text('No Notifications', style: theme.textTheme.headline1),
                SizedBox(height: 8.0),
                Text('We will notify you when something arrives',
                    style: theme.textTheme.subtitle1),
                SizedBox(height: 15.0),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _isShowNotificationList = true;
                    });
                  },
                  child: Text('Show Notification Example',
                      style: theme.textTheme.button),
                ),
              ],
            ),
    );
  }
}
