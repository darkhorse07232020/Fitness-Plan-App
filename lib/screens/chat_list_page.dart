import 'dart:async';


import 'package:emoji_picker/emoji_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../helpers/colors.dart';
import '../helpers/screens.dart';
import '../helpers/toast.dart';
import '../models/chat_model.dart';
import '../providers/theme_providers.dart';
import '../widgets/chat_bubble_widget.dart';
import 'video_call_page.dart';

class ChatListPage extends StatefulWidget {
  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  static const String report = 'Report';
  static const String resetChat = 'Delete all chats';

  TextEditingController controller = TextEditingController();
  ScrollController _scrollController = ScrollController();

  static const List<String> popList = <String>[
    report,
    resetChat,
  ];

  bool _showEmoji = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 5,
              backgroundColor: Colors.greenAccent,
            ),
            SizedBox(width: 10.0),
            Text('Jessica Veranda', style: theme.textTheme.headline4),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(FlutterIcons.video_outline_mco),
            onPressed: () {
              Get.to(VideoCallPage());
            },
          ),
          PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return popList.map((e) {
                  return PopupMenuItem<String>(
                    value: e,
                    child: Text(e, style: theme.textTheme.bodyText2),
                  );
                }).toList();
              })
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: chatListBuilder(),
            ),
            writeMessageField(context),
            _showEmoji
                ? EmojiPicker(
                    rows: 3,
                    columns: 7,
                    indicatorColor: theme.primaryColor,
                    bgColor: theme.backgroundColor,
                    buttonMode: ButtonMode.MATERIAL,
                    recommendKeywords: ["racing", "horse"],
                    numRecommended: 10,
                    onEmojiSelected: (emoji, category) {
                      setState(() {
                        controller.text = controller.text + emoji.emoji;
                      });
                    },
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  chatListBuilder() {
    return ListView.builder(
      itemCount: chatList.length,
      shrinkWrap: true,
      controller: _scrollController,
      scrollDirection: Axis.vertical,
      dragStartBehavior: DragStartBehavior.down,
      padding: EdgeInsets.only(top: 25.0, left: 18.0),
      itemBuilder: (context, index) {
        var chat = chatList[index];
        return ChatBubble(
          chat: chat,
        );
      },
    );
  }

  void _newTaskModalBottomSheet(context) {


    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.image),
                    title: Text('Image'),
                    onTap: () => showFilePicker(FileType.image)),
                ListTile(
                    leading: Icon(Icons.videocam),
                    title: Text('Video'),
                    onTap: () => showFilePicker(FileType.video)),
                ListTile(
                  leading: Icon(Icons.insert_drive_file),
                  title: Text('File'),
                  onTap: () => showFilePicker(FileType.any),
                ),
              ],
            ),
          );
        });
  }

  showFilePicker(FileType fileType) async {
    Navigator.pop(context);
  }

  void choiceAction(String choice) {
//    Hive.box(chatBox).clear();
    toast('Chat has been deleted!');
  }

  Container writeMessageField(BuildContext context) {
    final theme = Theme.of(context);
    final themeProv = Provider.of<ThemeProvider>(context);
    return Container(
      width: Screen.width(context),
      height: 60.0,
      color: theme.backgroundColor,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(FlutterIcons.attach_file_mdi),
            color: themeProv.isLightTheme
                ? kBackgroundDarkColor
                : kBackgroundLightColor,
            onPressed: () {
              _newTaskModalBottomSheet(context);
            },
          ),
          IconButton(
            icon: Icon(FlutterIcons.smileo_ant),
            color: themeProv.isLightTheme
                ? kBackgroundDarkColor
                : kBackgroundLightColor,
            onPressed: () {
              if (_showEmoji == false) {
                setState(() {
                  _showEmoji = true;
                  FocusScope.of(context).requestFocus(new FocusNode());
                });
              } else {
                setState(() {
                  _showEmoji = false;
                  FocusScope.of(context).requestFocus(new FocusNode());
                });
              }
            },
          ),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              height: 35.0,
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                color: themeProv.isLightTheme
                    ? kBackgroundDarkColor.withOpacity(.1)
                    : kAccentLightColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: TextField(
                  cursorColor: theme.primaryColor,
                  style: theme.textTheme.bodyText2,
                  onTap: () {
                    setState(() {
                      _showEmoji = false;
                    });
                  },
                  controller: controller,
                  decoration: InputDecoration(
                      hintText: "Write a message...",
                      hintStyle: theme.textTheme.subtitle2,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 15.0)),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(FlutterIcons.send_mdi),
            color: theme.primaryColor,
            onPressed: () {
              if (controller.text == '') {
                toast('Cannot send empty message');
//                themeProv.changeTheme();
                return;
              }
              final message = ChatModel(
                createdAt: DateTime.now(),
                sendTime: "",
                isRead: true,
                message: controller.text,
                isByMe: true,
              );
              sendMessageToBarber(message);
            },
          ),
        ],
      ),
    );
  }

  void sendMessageToBarber(ChatModel chat) {
//    final message = Hive.box(chatBox);
//    message.add(chat);
    controller.clear();
    Timer(
        Duration(milliseconds: 500),
        () => _scrollController
            .jumpTo(_scrollController.position.maxScrollExtent));
  }
}

class CustomPopupMenu {
  CustomPopupMenu({this.title, this.icon});

  String title;
  IconData icon;
}

class SelectedOption extends StatelessWidget {
  final CustomPopupMenu choice;

  SelectedOption({Key key, this.choice}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(choice.icon, size: 140.0, color: Colors.white),
            Text(
              choice.title,
              style: TextStyle(color: Colors.white, fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
