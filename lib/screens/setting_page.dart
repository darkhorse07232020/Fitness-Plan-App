import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/screens.dart';
import '../providers/theme_providers.dart';



class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _notification = false;
  bool _call = false;
  bool _location = false;
  bool _vibrate = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: theme.textTheme.headline4),
        centerTitle: true,
      )
      ,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Container(
              width: Screen.width(context),
              height: 50.0,
              color: theme.cardColor,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Text('Settings', style: theme.textTheme.headline4),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Notification', style: theme.textTheme.bodyText2),
                  Switch(
                    value: _notification,
                    activeColor: theme.primaryColor,
                    onChanged: (value) {
                      setState(() {
                        _notification = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Call', style: theme.textTheme.bodyText2),
                  Switch(
                    value: _call,
                    activeColor: theme.primaryColor,
                    onChanged: (value) {
                      setState(() {
                        _call = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Location', style: theme.textTheme.bodyText2),
                  Switch(
                    value: _location,
                    activeColor: theme.primaryColor,
                    onChanged: (value) {
                      setState(() {
                        _location = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Light Theme', style: theme.textTheme.bodyText2),
                  Switch(
                    value: Provider.of<ThemeProvider>(context, listen: false)
                        .isLightTheme,
                    activeColor: theme.primaryColor,
                    onChanged: (value) {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .changeTheme();
                    },
                  ),
                ],
              ),
            ),
//            SizedBox(height: 20.0),
            Container(
              width: Screen.width(context),
              height: 50.0,
              color: theme.cardColor,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Text('Reminder Setting', style: theme.textTheme.headline4),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Vibrate', style: theme.textTheme.bodyText2),
                  Switch(
                    value: _vibrate,
                    activeColor: theme.primaryColor,
                    onChanged: (value) {
                      setState(() {
                        _vibrate = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: Screen.width(context),
              height: 50.0,
              color: theme.cardColor,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Text('General', style: theme.textTheme.headline4),
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: GestureDetector(
                onTap: () {
//                  Get.to(AboutUsPage());
                },
                child: Text('About Beauty Barber',
                    style: theme.textTheme.bodyText2),
              ),
            ),
            SizedBox(height: 15.0),
//            Padding(
//              padding: const EdgeInsets.symmetric(horizontal: 18.0),
//              child: Text('Privacy Policy', style: kHeadline5),
//            ),
          ],
        ),
      ),
    );
  }
}
