import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

import '../helpers/colors.dart';
import '../helpers/toast.dart';
import 'chat_list_page.dart';

class VideoCallPage extends StatefulWidget {
  @override
  _VideoCallPageState createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  bool _sound = false;
  bool _video = false;
  bool _mic = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Image.asset(
                'assets/images/other/2.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                left: 20.0,
                right: 20.0,
                bottom: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_sound == false) {
                          setState(() {
                            _sound = true;
                          });
                        } else {
                          setState(() {
                            _sound = false;
                          });
                        }
                      },
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundColor:
                            _sound ? kBackgroundLightColor : theme.primaryColor,
                        child: Icon(
                          _sound
                              ? FlutterIcons.sound_ant
                              : FlutterIcons.md_volume_mute_ion,
                          color: _sound
                              ? theme.primaryColor
                              : kBackgroundLightColor,
                          size: 25.0,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_video == false) {
                          setState(() {
                            _video = true;
                          });
                        } else {
                          setState(() {
                            _video = false;
                          });
                        }
                      },
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundColor:
                            _video ? kBackgroundLightColor : theme.primaryColor,
                        child: Icon(
                          _video
                              ? FlutterIcons.videocam_mdi
                              : Icons.videocam_off,
                          color: _video
                              ? theme.primaryColor
                              : kBackgroundLightColor,
                          size: 25.0,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 25.0,
                      backgroundColor: theme.errorColor,
                      child: Icon(
                        FlutterIcons.call_mdi,
                        color: kBackgroundLightColor,
                        size: 25.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_mic == false) {
                          setState(() {
                            _mic = true;
                          });
                        } else {
                          setState(() {
                            _mic = false;
                          });
                        }
                      },
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundColor:
                            _mic ? kBackgroundLightColor : theme.primaryColor,
                        child: Icon(
                          _mic ? Icons.mic : Icons.mic_off,
                          color:
                              _mic ? theme.primaryColor : kBackgroundLightColor,
                          size: 25.0,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(ChatListPage());
                      },
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundColor: theme.primaryColor,
                        child: Icon(
                          FlutterIcons.message_ent,
                          color: kBackgroundLightColor,
                          size: 25.0,
                        ),
                      ),
                    ),
                  ],
                )),
            Positioned(
                right: 20.0,
                bottom: 150.0,
                child: Container(
                  width: 100.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: kBackgroundLightColor),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      'assets/avatars/barber5.jpg',
                      width: 100.0,
                      height: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            Positioned(
                top: 50.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          FlutterIcons.camera_fea,
                          color: kBackgroundLightColor,
                        ),
                        onPressed: () {
                          toast('Camera changed pressed');
                        },
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Helen White',
                              style: theme.textTheme.headline3
                                  .copyWith(color: kBackgroundLightColor),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Live | 8:30',
                                    style: theme.textTheme.subtitle2),
                                SizedBox(width: 12.0),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: theme.errorColor,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.videocam,
                                          color: kBackgroundLightColor,
                                          size: 12.0),
                                      Text('Live',
                                          style: theme.textTheme.headline4),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          FlutterIcons.more_vert_mdi,
                          color: kBackgroundLightColor,
                        ),
                        onPressed: () {
                          toast('camera pressed');
                        },
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
