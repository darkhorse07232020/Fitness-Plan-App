import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Screen {
  static double heigth(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double statusbarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 728.0 ? true : false;
  }

  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? true
        : false;
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? true
        : false;
  }

  static void hideSystemBars() {
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  static void showSystemBars() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  static double logoSize(BuildContext context) {
    if (Screen.isPortrait(context)) {
      return Screen.heigth(context) * 0.05;
    } else {
      return Screen.width(context) * 0.05;
    }
  }

  static void setPortrait() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  static void setLandscape() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  static void resetOrientation() async {
    await SystemChrome.setPreferredOrientations([]);
  }
}