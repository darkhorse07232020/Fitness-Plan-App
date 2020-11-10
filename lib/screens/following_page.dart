import 'package:flutter/material.dart';


class FollowingPage extends StatefulWidget {
  @override
  _FollowingPageState createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  bool _isFollowing = true;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Following', style: theme.textTheme.headline4),
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 18.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/avatars/barber3.jpg'),
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Jessica Veranda', style: theme.textTheme.headline3),
                      Text('@jscvrnd19', style: theme.textTheme.subtitle2),
                      Text(
                        'quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto',
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
                _isFollowing
                    ? Container(
                        width: 95.0,
                        height: 30.0,
                        child: RaisedButton(
                          onPressed: () {
                            setState(() {
                              _isFollowing = !_isFollowing;
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: theme.primaryColor,
                          child: Center(
                            child: Text(
                              'Following',
                              style: theme.textTheme.button.copyWith(fontSize: 12.0),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        width: 80,
                        height: 30.0,
                        child: OutlineButton(
                          onPressed: () {
                            setState(() {
                              _isFollowing = !_isFollowing;
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          borderSide: BorderSide(color: theme.primaryColor),
                          color: theme.primaryColor,
                          child: Center(
                            child: Text(
                              'Follow',
                              style: theme.textTheme.subtitle2,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
