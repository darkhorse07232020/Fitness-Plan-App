

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers/colors.dart';
import '../helpers/screens.dart';
import '../helpers/toast.dart';
import '../helpers/website.dart';
import '../models/barber_model.dart';
import '../models/salon_model.dart';
import '../widgets/barber_card_widget.dart';
import '../widgets/salon_tabbar/salon_about_tab_bar_view.dart';
import '../widgets/salon_tabbar/salon_gallery_tab_bar_view.dart';
import '../widgets/salon_tabbar/salon_review_tab_bar_view.dart';
import '../widgets/salon_tabbar/salon_service_tab_bar_view.dart';
import 'book_appointment_services_page.dart';
import 'direction_page.dart';

class SalonPage extends StatefulWidget {
  final SalonModel salon;

  const SalonPage({Key key, @required this.salon}) : super(key: key);

  @override
  _SalonPageState createState() => _SalonPageState();
}

class _SalonPageState extends State<SalonPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool _isBookmarked = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  final List<Widget> salonTab = [
    Tab(text: 'About'),
    Tab(text: 'Services'),
    Tab(text: 'Gallery'),
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              pinned: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color: theme.primaryColor,
                onPressed: () {
                  Get.back();
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(
                      _isBookmarked ? Icons.bookmark : Icons.bookmark_border),
                  color: theme.primaryColor,
                  onPressed: () {
                    setState(() {
                      _isBookmarked = !_isBookmarked;
                    });
                  },
                ),
              ],
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Image.asset(
                      widget.salon.image,
                      width: Screen.width(context),
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 0.0,
                      left: 0.0,
                      right: 0.0,
                      bottom: 0.0,
                      child: Container(
                        color: Colors.black45,
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      child: Container(
                        width: Screen.width(context),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.salon.name,
                                style: theme.textTheme.headline3
                                    .copyWith(color: kBackgroundLightColor)),
                            Text(widget.salon.address,
                                style: theme.textTheme.subtitle1
                                    .copyWith(color: kSecondaryLightColor)),
                            SizedBox(height: 15.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SmoothStarRating(
                                      color: kYellowColor,
                                      spacing: 5.0,
                                      borderColor: theme.unselectedWidgetColor,
                                      allowHalfRating: false,
                                      starCount: 5,
                                      isReadOnly: true,
                                      rating: widget.salon.rating,
                                      size: 18.0,
                                    ),
                                    SizedBox(width: 15.0),
                                    Text(
                                      "(${widget.salon.totalReview} reviews)",
                                      style: theme.textTheme.subtitle2,
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 2.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: kGreenColor),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'OPEN',
                                      style: theme.textTheme.bodyText2
                                          .copyWith(color: kGreenColor),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 25.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _salonButtonFeature(
                        context,
                        icon: FlutterIcons.globe_fea,
                        label: 'Website',
                        onTap: () {
                          Get.to(WebViewExample());
                        },
                      ),
                      _salonButtonFeature(
                        context,
                        icon: FlutterIcons.phone_call_fea,
                        label: 'Call',
                        onTap: () {
                          _showDialogToCall(context);
                        },
                      ),
                      _salonButtonFeature(
                        context,
                        icon: FlutterIcons.map_fea,
                        label: 'Direction',
                        onTap: () {
                          Get.to(DirectionPage());
                        },
                      ),
                      _salonButtonFeature(
                        context,
                        icon: FlutterIcons.share_2_fea,
                        label: 'Share',
                        onTap: () {
                          _newTaskModalBottomSheet(context);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text('Salon specialists',
                      style: theme.textTheme.headline3),
                ),

                SizedBox(height: 15.0),
                Container(
                  width: Screen.width(context),
                  height: 140.0,
                  child: ListView.builder(
                    itemCount: allBarberList.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    itemBuilder: (context, index) {
                      var barber = allBarberList[index];
                      return BarberCard(
                        barber: barber,
                        salon: widget.salon,
                      );
                    },
                  ),
                ),
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
                    AboutTabBarView(salon: widget.salon),
                    ServiceTabBarView(),
                    GalleryTabBarView(salon: widget.salon),
                    ReviewTabBarView(),
                  ][_tabController.index],
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: theme.primaryColor,
        onPressed: () {
          Get.to(BookAppointmentServicesPage());
        },
        label: Text('Book now',style: theme.textTheme.button),
      ),
    );
  }

  _salonButtonFeature(BuildContext context,
      {void Function() onTap, IconData icon, String label}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.0),
      child: Column(
        children: [
          Icon(
            icon,
            size: 25.0,
          ),
          SizedBox(height: 12.0),
          Text(label, style: Theme.of(context).textTheme.bodyText2),
        ],
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
            'Call with ${widget.salon.name} ?',
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

  void _newTaskModalBottomSheet(context) {
    final theme = Theme.of(context);
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.0),
          topLeft: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('SHARE TO', style: theme.textTheme.headline1),
              )),
              Divider(color: theme.unselectedWidgetColor),
              SizedBox(height: 25.0),
              Expanded(
                child: new GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 12.0,
                  ),
                  children: [
                    shareItem(
                      icon: FlutterIcons.contacts_mdi,
                      title: 'Friends',
                      color: 0xFF36C3B9,
                      onTap: () {
                        Get.back();
                        toast('Friends Clicked!');
                      },
                    ),
                    shareItem(
                      icon: FlutterIcons.facebook_ent,
                      title: 'Facebook',
                      color: 0xFF225BD9,
                      onTap: () {
                        Get.back();
                        toast('Facebook Clicked!');
                      },
                    ),
                    shareItem(
                      icon: FlutterIcons.facebook_messenger_mco,
                      title: 'Messenger',
                      color: 0xFF1190FE,
                      onTap: () {
                        Get.back();
                        toast('Messenger Clicked!');
                      },
                    ),
                    shareItem(
                      icon: FlutterIcons.message_ent,
                      title: 'Message',
                      color: 0xFF43D559,
                      onTap: () {
                        Get.back();
                        toast('Message Clicked!');
                      },
                    ),
                    shareItem(
                      icon: FlutterIcons.mail_mdi,
                      title: 'Email',
                      color: 0xFFEA403E,
                      onTap: () {
                        Get.back();
                        toast('Email Clicked!');
                      },
                    ),
                    shareItem(
                      icon: FlutterIcons.pinterest_faw,
                      title: 'Pinterest',
                      color: 0xFFB50A1A,
                      onTap: () {
                        Get.back();
                        toast('Pinterest Clicked!');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  InkWell shareItem({
    @required IconData icon,
    @required String title,
    @required Function onTap,
    @required int color,
  }) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundColor: Color(color),
              child: Icon(icon, color: kBackgroundLightColor),
            ),
            SizedBox(height: 13.0),
            Text(
              title,
              style: theme.textTheme.subtitle1,
            )
          ],
        ),
      ),
    );
  }
}
