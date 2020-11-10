

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../helpers/colors.dart';
import '../helpers/screens.dart';
import '../helpers/toast.dart';
import 'Appointment_page.dart';
import 'about_us_page.dart';
import 'change_password_page.dart';
import 'favorite_barber_and_salon_page.dart';
import 'followers_page.dart';
import 'following_page.dart';
import 'likes_page.dart';
import 'notification_page.dart';
import 'payment_method_page.dart';
import 'profile_change_language_page.dart';
import 'profile_edit_page.dart';
import 'setting_page.dart';
import 'support_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: appBar(context),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: Screen.width(context),
                height: 170.0,
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 35.0,
                          backgroundColor: theme.unselectedWidgetColor,
                          backgroundImage: AssetImage(
                            'assets/avatars/barber3.jpg',
                          ),
                        ),
                        SizedBox(width: 18.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Jessica Veranda',
                                style: theme.textTheme.headline1),
                            SizedBox(height: 5.0),
                            Text('jscvrnd19@gmail.com',
                                style: theme.textTheme.subtitle2),
                            SizedBox(height: 15.0),
                            SizedBox(
                              width: 150,
                              height: 30.0,
                              child: OutlineButton(
                                onPressed: () {
                                  Get.to(EditProfilePage());
                                },
                                borderSide:
                                    BorderSide(color: theme.primaryColor),
                                color: kGreenColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Center(
                                  child: Text('Edit profile',
                                      style: theme.textTheme.subtitle1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 18.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(25.0),
                            onTap: () {
                              Get.to(FollowingPage());
                            },
                            child: Column(
                              children: [
                                Text('128', style: theme.textTheme.headline4),
                                Text('Following',
                                    style: theme.textTheme.subtitle2.copyWith(
                                        color: theme.unselectedWidgetColor)),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(25.0),
                            onTap: () {
                              Get.to(FollowersPage());
                            },
                            child: Column(
                              children: [
                                Text('640', style: theme.textTheme.headline4),
                                Text('Follower',
                                    style: theme.textTheme.subtitle2.copyWith(
                                        color: theme.unselectedWidgetColor)),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(25.0),
                            onTap: () {
                              Get.to(LikesPage());
                            },
                            child: Column(
                              children: [
                                Text('240', style: theme.textTheme.headline4),
                                Text('Likes',
                                    style: theme.textTheme.subtitle2.copyWith(
                                        color: theme.unselectedWidgetColor)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15.0),
              Column(
                children: [
                  ProfileItem(
                    icon: FlutterIcons.shopping_cart_fea,
                    title: 'Booking Order & Appointments',
                    onTap: () {
                      Get.to(AppointmentPage());
                    },
                  ),
                  ProfileItem(
                    icon: FlutterIcons.favorite_border_mdi,
                    title: 'Favourite Barbers & Salon',
                    onTap: () {
                      Get.to(FavoriteBarberAndSalonPage());
                    },
                  ),
                  ProfileItem(
                    icon: FlutterIcons.credit_card_fea,
                    title: 'Payment Method',
                    onTap: () {
                      Get.to(PaymentMethodPage());
                    },
                  ),
                  ProfileItem(
                    icon: FlutterIcons.key_ent,
                    title: 'Change Password',
                    onTap: () {
                      Get.to(ChangePasswordPage());
                    },
                  ),
                  ProfileItem(
                    icon: FlutterIcons.support_faw,
                    title: 'Support',
                    onTap: () {
                      Get.to(SupportPage());
                    },
                  ),
                  ProfileItem(
                    icon: FlutterIcons.star_fea,
                    title: 'Rate the app',
                    onTap: () {
                      showRatingDialog(context);
                    },
                  ),
                  ProfileItem(
                    icon: FlutterIcons.language_mdi,
                    title: 'Language',
                    onTap: () {
                      Get.to(ProfileChangeLanguagePage());
                    },
                  ),
                  ProfileItem(
                    icon: FlutterIcons.information_outline_mco,
                    title: 'About Us',
                    onTap: () {
                      Get.to(AboutUsPage());
                    },
                  ),
                  ProfileItem(
                    icon: FlutterIcons.exit_to_app_mco,
                    title: 'Log out',
                    onTap: () {
                      showSignOutDialog(context);
                    },
                  ),
                  SizedBox(height: 60.0),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  showSignOutDialog(BuildContext context) {
    final theme = Theme.of(context);
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          title: Icon(
            FlutterIcons.ios_warning_ion,
            color: theme.errorColor,
            size: 45.0,
          ),
          content: Container(
            height: 50.0,
            child: Center(
                child: Text('Are you sure?', style: theme.textTheme.headline3)),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Exit', style: theme.textTheme.headline4),
            ),
            FlatButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Cancel', style: theme.textTheme.subtitle1),
            ),
          ],
        );
      },
    );
  }

  showRatingDialog(BuildContext context) {
    final theme = Theme.of(context);
    TextEditingController rateCtrl = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          title: Center(
              child: Text('Rate the app', style: theme.textTheme.headline3)),
          content: Container(
            height: 130.0,
            child: Column(
              children: [
                SmoothStarRating(
                  color: kYellowColor,
                  size: 25.0,
                  onRated: (rating) {},
                  borderColor: theme.unselectedWidgetColor,
                  allowHalfRating: false,
                  rating: 0.0,
                  starCount: 5,
                  isReadOnly: false,
                ),
                SizedBox(height: 15.0),
                Container(
                  width: Screen.width(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: theme.primaryColor),
                  ),
                  child: TextField(
                    cursorColor: theme.primaryColor,
                    style: theme.textTheme.subtitle1,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    controller: rateCtrl,
                    decoration: InputDecoration(
                      hintText: 'Tell us about this app',
                      hintStyle: theme.textTheme.subtitle1
                          .copyWith(color: theme.unselectedWidgetColor),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                if (rateCtrl.text == '') {
                  toast('Cannot send empty rate');
                } else {
                  Get.back();
                  toast('Thank you for your feedback');
                }
              },
              child: Text('Confirm', style: theme.textTheme.headline4),
            ),
            FlatButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Cancel', style: theme.textTheme.subtitle1),
            ),
          ],
        );
      },
    );
  }

  AppBar appBar(BuildContext context) {


    return AppBar(
      leading: Container(),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications_none,
          ),
          onPressed: () {
            Get.to(NotificationPage());
          },
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Get.to(SettingPage());
          },
        ),
      ],
    );
  }


  GestureDetector shareItem(
    BuildContext context, {
    @required IconData icon,
    @required String title,
    @required Function onTap,
    @required int color,
  }) {
    final theme = Theme.of(context);

    return GestureDetector(
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
              style: theme.textTheme.bodyText2,
            )
          ],
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  const ProfileItem(
      {Key key,
      @required this.icon,
      @required this.title,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Screen.width(context),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  Icon(icon, size: 22.0),
                  SizedBox(width: 15.0),
                  Text(title, style: theme.textTheme.subtitle2),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, size: 22.0),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Divider(color: theme.unselectedWidgetColor),
            ),
          ],
        ),
      ),
    );
  }
}
