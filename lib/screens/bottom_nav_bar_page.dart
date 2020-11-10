import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

import '../helpers/colors.dart';
import 'Appointment_page.dart';
import 'chat_page.dart';
import 'home_page.dart';
import 'nearby_page.dart';
import 'profile_page.dart';

class BottomNavigationBarPage extends StatefulWidget {
  @override
  _BottomNavigationBarPageState createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage>
    with TickerProviderStateMixin {
  var _bottomNavIndex = 0; //default index of first screen
  TabController _tabController;

  AnimationController _animationController;
  Animation<double> animation;
  CurvedAnimation curve;

  final iconList = <IconData>[
    FlutterIcons.home_fea,
    FlutterIcons.location_pin_sli,
    FlutterIcons.calendar_check_outline_mco,
    FlutterIcons.user_fea,
  ];

  var currentTab = [
    HomePage(),
    NearbyPage(),
    AppointmentPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: currentTab.length);
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: <Widget>[
          NotificationListener<UserScrollNotification>(
            child: TabBarView(
              children: currentTab,
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
            ),
            onNotification: (UserScrollNotification notification) {
              if (true) {
                if (notification.direction == ScrollDirection.reverse &&
                    notification.metrics.extentAfter > kToolbarHeight &&
                    notification.metrics.axis == Axis.vertical) {
                  _animationController.forward();
                } else if (notification.direction == ScrollDirection.forward) {
                  _animationController.reverse();
                }
              }
              return true;
            },
          ),
        ],
      ),
      floatingActionButton: ScaleTransition(
        scale: animation,
        child: FloatingActionButton(
          elevation: 8,
          backgroundColor: kYellowColor,
          child: Icon(
            Icons.message,
            color: kBackgroundLightColor,
          ),
          onPressed: () {
            _animationController.reset();
            _animationController.forward();
            Get.to(ChatPage());
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        backgroundColor: theme.cardColor,
        activeIndex: _bottomNavIndex,
        activeColor: theme.primaryColor,
        splashColor: theme.primaryColor,
        inactiveColor: theme.unselectedWidgetColor,
        notchAndCornersAnimation: animation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
            _tabController.animateTo(_bottomNavIndex);
          });
        },
      ),
    );
  }
}
