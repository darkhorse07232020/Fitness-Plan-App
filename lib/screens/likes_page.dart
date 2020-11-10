import 'package:flutter/material.dart';


class LikesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme =Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('People likes you', style: theme.textTheme.headline4),
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 18.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage: AssetImage('assets/avatars/barber3.jpg'),
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Jessica Veranda', style: theme.textTheme.headline3),
                      Text('@jscvrnd19',
                          style: theme.textTheme.subtitle2),
                      Text(
                        'quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto',
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.subtitle1,
                      ),
                    ],
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
