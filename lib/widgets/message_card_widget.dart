import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/barber_model.dart';
import '../screens/chat_list_page.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({Key key, @required this.barber}) : super(key: key);

  final BarberModel barber;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Get.to(ChatListPage());
      },
      child: Container(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage(barber.image),
              ),
              title: Text(barber.name, style: theme.textTheme.headline4),
              subtitle: Text(
                barber.lastMessage,
                style: theme.textTheme.subtitle1,
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    barber.lastSeenTime,
                    style: theme.textTheme.subtitle2,
                  ),
                  SizedBox(height: 5.0),
                  barber.haveunreadmessages
                      ? CircleAvatar(
                          radius: 10.0,
                          backgroundColor: theme.primaryColor,
                          child: Text(barber.unreadmessages.toString(),
                              style: theme.textTheme.headline4),
                        )
                      : Container(
                          width: 1,
                        ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Divider(color: theme.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
