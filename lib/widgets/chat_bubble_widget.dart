import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/colors.dart';
import '../models/chat_model.dart';
import '../providers/theme_providers.dart';

class ChatBubble extends StatelessWidget {
  final ChatModel chat;

  ChatBubble({@required this.chat});

  @override
  Widget build(BuildContext context) {
    return chat.isByMe
        ? senderChatBubble(context)
        : receiverChatBubble(context);
  }

  Align receiverChatBubble(BuildContext context) {
    final theme = Theme.of(context);
    final themeProv = Provider.of<ThemeProvider>(context);

    return Align(
      alignment: Alignment.topLeft,
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage('assets/avatars/barber3.jpg'),
              ),
              SizedBox(width: 10.0),
              Container(
                margin: EdgeInsets.only(right: 25.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: themeProv.isLightTheme
                      ? kBackgroundDarkColor.withOpacity(.1)
                      : theme.cardColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(chat.message, style: theme.textTheme.bodyText2),
                    SizedBox(height: 5.0),
                    Text(chat.sendTime, style: theme.textTheme.subtitle2),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Align senderChatBubble(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.topRight,
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          alignment: Alignment.topRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: 10.0),
              Container(
                margin: EdgeInsets.only(right: 25.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      chat.message,
                      style: theme.textTheme.bodyText2
                          .copyWith(color: theme.backgroundColor),
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          chat.sendTime.toString(),
                          style: theme.textTheme.subtitle2
                              .copyWith(color: kBackgroundLightColor),
                        ),
                        SizedBox(width: 8),
                        Icon(chat.isRead ? Icons.done_all : Icons.done,
                            color: theme.backgroundColor, size: 10.0),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
