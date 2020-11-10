import '../helpers/toast.dart';
import '../models/comment_model.dart';
import '../screens/comment_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentCard extends StatefulWidget {
  final CommentModel comment;
  final int index;

  const CommentCard({Key key, this.comment, this.index}) : super(key: key);

  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      margin: EdgeInsets.only(bottom: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52.0,
            height: 52.0,
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: theme.primaryColor)),
            child: CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage(
                  widget.comment.image ?? 'assets/avatars/barber5.jpg'),
            ),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${widget.comment.username}  ' ?? '',
                        style: theme.textTheme.bodyText2),
                    GestureDetector(
                      onTap: () {
                        showCommentDialog(context, widget.index);
                      },
                      child: Icon(Icons.more_horiz, size: 25),
                    ),
                  ],
                ),
                Text(
                  widget.comment.comment ?? '',
                  style: theme.textTheme.subtitle1
                      .copyWith(color: theme.unselectedWidgetColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${timeago.format(widget.comment.createdAt ?? DateTime.now())}' ??
                          '',
                      style: theme.textTheme.subtitle2
                          .copyWith(color: theme.unselectedWidgetColor),
                    ),
                    GestureDetector(
                        onTap: () {
                          if (_isLiked == false) {
                            setState(() {
                              _isLiked = true;
                            });
                          } else {
                            setState(() {
                              _isLiked = false;
                            });
                          }
                        },
                        child: Icon(
                            _isLiked ? Icons.favorite : Icons.favorite_border,
                            size: 14.0,
                            color: theme.unselectedWidgetColor)),
                    GestureDetector(
                      onTap: () {
                        controllerReply.text = "@" + widget.comment.username;
                      },
                      child: Text(
                        'Reply',
                        style: theme.textTheme.subtitle2
                            .copyWith(color: theme.unselectedWidgetColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showCommentDialog(BuildContext context, index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: GestureDetector(
              onTap: () {
                Get.back();
                toast('comment deleted');
              },
              child:
                  Text('Delete', style: Theme.of(context).textTheme.subtitle1)),
        );
      },
    );
  }
}
