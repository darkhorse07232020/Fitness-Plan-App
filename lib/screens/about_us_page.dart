import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/website.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('About us', style: theme.textTheme.headline4),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/other/4.jpg',
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('About us', style: theme.textTheme.headline2),
                    SizedBox(height: 15.0),
                    Text(
                      'ea molestias quasi exercitationem repellat qui ipsa sit aut',
                      style: theme.textTheme.bodyText2,
                    ),
                    SizedBox(height: 15.0),
                    SizedBox(
                      width: 150.0,
                      height: 50.0,
                      child: RaisedButton(
//                        title: 'Learn More',
                        onPressed: () {
                          Get.to(WebViewExample());
                        },
                        child:
                            Text('Learn more', style: theme.textTheme.button),
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Text('Our purpose', style: theme.textTheme.headline2),
                    Container(
                      width: 46.0,
                      height: 10.0,
                      color: theme.primaryColor,
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      "aut dicta possimus sint mollitia voluptas commodi quo doloremque\niste corrupti reiciendis voluptatem eius rerum\nsit cumque quod eligendi laborum minima\nperferendis recusandae assumenda consectetur porro architecto ipsum ipsam",
                      style: theme.textTheme.subtitle1,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
