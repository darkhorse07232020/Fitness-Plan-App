
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers/colors.dart';
import '../helpers/screens.dart';
import '../models/barber_model.dart';
import '../models/salon_model.dart';
import '../widgets/barber_tabbar/barber_basic_info_tab_bar_view.dart';
import '../widgets/barber_tabbar/barber_review_tab_bar_view.dart';
import '../widgets/barber_tabbar/portfolio_tab_bar_view.dart';
import '../widgets/oval_bottom_clipper.dart';
import 'book_appointment_services_page.dart';
import 'chat_list_page.dart';
import 'video_call_page.dart';

class BarberPage extends StatefulWidget {
  final BarberModel barber;
  final SalonModel salon;

  const BarberPage({Key key, @required this.salon, this.barber})
      : super(key: key);

  @override
  _BarberPageState createState() => _BarberPageState();
}

class _BarberPageState extends State<BarberPage> with TickerProviderStateMixin {
  TabController _tabController;



  bool _isBookmarked = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  final List<Widget> salonTab = [
    Tab(text: 'Basic Info'),
    Tab(text: 'Portfolio'),
    Tab(text: 'Review'),
  ];

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: new Text(
          'Profile',
          style: theme.textTheme.headline3,
        ),
        centerTitle: true,
        backgroundColor: theme.backgroundColor,
        actions: [
          IconButton(
            icon: Icon(_isBookmarked ? Icons.bookmark : Icons.bookmark_border),
            color: theme.primaryColor,
            onPressed: () {
              setState(() {
                _isBookmarked = !_isBookmarked;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.0),
            Container(
              width: Screen.width(context),
              height: 250.0,
              child: Stack(
                children: [
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    right: 0.0,
                    bottom: 50.0,
                    child: ClipPath(
                      clipper: OvalBottomBorderClipper(),
                      child: Image.asset(
                        'assets/images/other/3.jpg',
                        height: 200.0,
                        width: Screen.width(context),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 0.0,
                    child: Center(
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: theme.primaryColor),
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(widget.barber.image),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 210.0,
                    bottom: 10.0,
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: theme.backgroundColor,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(2.0),
                      child: CircleAvatar(backgroundColor: kGreenColor),
                    ),
                  ),
                  Positioned(
                    left: 19.0,
                    bottom: 30.0,
                    child: Container(
                      width: 65.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                          color: theme.primaryColor.withOpacity(.3),
                          borderRadius: BorderRadius.circular(5.0)),
                      padding: EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Center(
                          child: Text('OPEN', style: theme.textTheme.bodyText2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Text(widget.barber.name ?? "", style: theme.textTheme.headline3),
            SizedBox(height: 5.0),
            Text(
              '${widget.barber.position} at Gentleman Barbershop',
              style: theme.textTheme.bodyText2,
            ),
            SizedBox(height: 5.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothStarRating(
                  color: kYellowColor,
                  size: 25.0,
                  isReadOnly: true,
                  spacing: 1.5,
                  starCount: 5,
                  rating: 4.0,
                  allowHalfRating: false,
                  borderColor: theme.unselectedWidgetColor,
                ),
                SizedBox(width: 5.0),
                Text(
                  '(125 Reviews)',
                  style: theme.textTheme.subtitle2,
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileItem(
                  onTap: () {
                    Get.to(ChatListPage());
                  },
                  color: kBlueColor,
                  title: 'Chat',
                  icon: 'assets/icons/chat.svg',
                ),
                ProfileItem(
                  onTap: () {
                    _showDialogToCall(context);
                  },
                  color: kYellowColor,
                  title: 'Call',
                  icon: 'assets/icons/call.svg',
                ),
                ProfileItem(
                  onTap: () {
                    Get.to(VideoCallPage());
                  },
                  color: theme.errorColor,
                  title: 'Video',
                  icon: 'assets/icons/video.svg',
                ),
                ProfileItem(
                  onTap: () {
                    Get.to(BookAppointmentServicesPage());
                  },
                  color: kGreenColor,
                  title: 'Book',
                  icon: 'assets/icons/book.svg',
                ),
              ],
            ),
            SizedBox(height:12.0),
            TabBar(
              controller: _tabController,
              indicatorColor: theme.primaryColor,
              labelColor: theme.primaryColor,
              unselectedLabelColor: theme.unselectedWidgetColor,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: salonTab,
            ),
            Center(
              child: [
                BarberBasicInfoTabBarView(barber: widget.barber),
                PortfolioTabBarView(),
                BarberTabBarView(),
              ][_tabController.index],
            ),
          ],
        ),
      ),
    );
  }

  _showDialogToCall(BuildContext context) {
    final theme = Theme.of(context);
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Call with ${widget.barber.name} ?',
            style: theme.textTheme.headline4,
            textAlign: TextAlign.center,
          ),
          content: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'Are you sure you want to call the number',
                style: theme.textTheme.subtitle1,
              ),
              TextSpan(
                text: ' +62 8903 9923 223 ?',
                style: theme.textTheme.headline5,
              )
            ]),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                launch("tel:+6289039923223");
              },
              child: Text(
                'Yes',
                style: theme.textTheme.headline4
                    .copyWith(color: theme.primaryColor),
              ),
            ),
            FlatButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'Cancel',
                style: theme.textTheme.subtitle1,
              ),
            ),
          ],
        );
      },
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String icon;
  final Color color;
  final String title;
  final Function onTap;

  const ProfileItem({Key key, this.icon, this.color, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80.0,
        child: Column(
          children: [
            CircleAvatar(
              radius: 22.0,
              backgroundColor: color,
              child: SvgPicture.asset(icon),
            ),
            SizedBox(height: 7.0),
            Text(title, style: Theme.of(context).textTheme.subtitle1),
          ],
        ),
      ),
    );
  }
}
