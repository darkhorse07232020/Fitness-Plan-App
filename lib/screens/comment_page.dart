import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/screens.dart';
import '../helpers/toast.dart';
import '../models/comment_model.dart';
import '../widgets/comment_card_widget.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

TextEditingController controllerReply = TextEditingController();

class _CommentPageState extends State<CommentPage> {
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments', style: theme.textTheme.headline3),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      )
      ,
      body: Container(
        child: Column(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: ListView.builder(
                itemCount: allCommentList.length,
                shrinkWrap: true,
                controller: _scrollController,
                padding: EdgeInsets.symmetric(vertical: 25.0),
                itemBuilder: (context, index) {
                  var comment = allCommentList[index];
                  return CommentCard(
                    comment: comment,
                    index: index,
                  );
                },
              ),
            ),
            Container(
              width: Screen.width(context),
//              height: 40.0,
              padding: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: AssetImage('assets/avatars/barber6.jpg'),
                  ),
                  SizedBox(width: 12.0),
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      cursorColor: theme.primaryColor,
                      controller: controllerReply,
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                        border: InputBorder.none,
                        hintStyle: theme.textTheme.subtitle2,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.0),
                  GestureDetector(
                    onTap: () {
                      if (controllerReply.text == '') {
                        toast('Cannot send empty comment');
                        return;
                      }

                    },
                    child: Text(
                      'Post',
                      style: theme.textTheme.button
                          .copyWith(color: theme.primaryColor),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
