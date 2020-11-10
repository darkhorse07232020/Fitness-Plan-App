import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../helpers/screens.dart';
import '../screens/sign_in_with_social_media_page.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController(initialPage: 0);
  int bottomSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            _onBoardingImages(
              image1: 'assets/images/onboarding/1.jpg',
              image2: 'assets/images/onboarding/2.jpg',
              image3: 'assets/images/onboarding/3.jpeg',
            ),
            _onBoardingCaption(context,
                title1: 'Find and Book Service',
                title2: 'Style that fit your Lifestyle',
                title3: 'We Provide Best Services Ever',
                subtitle1:
                    'Find and Book barber, Beauty, Salon & Spa services anywhere, anytime',
                subtitle2:
                    'Choose our Makeup special offer price Package that fit your Lifestyle',
                subtitle3:
                    'We will serve you well so that you remain handsome and stylish',
                onPressed: () {
              if (bottomSelectedIndex >= 2) {
                Get.to(SignInWithSocialMediaPage());
              } else {
                controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOutQuint);
                setState(() {
                  bottomSelectedIndex++;
                });
              }
            }),
          ],
        ),
      ),
    );
  }

  Positioned _onBoardingCaption(
    BuildContext context, {
    String title1,
    String title2,
    String title3,
    String subtitle1,
    String subtitle2,
    String subtitle3,
    @required onPressed,
  }) {
    final theme = Theme.of(context);
    return Positioned(
      top: 270.0,
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: ClipPath(
        clipper: Oval(),
        child: Container(
          color: theme.backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 120.0),
              Center(
                child: SmoothPageIndicator(
                  controller: controller,
                  onDotClicked: (index) {
                    bottomSelectedIndex = index;
                    controller.animateToPage(index,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                    setState(() {});
                  },
                  count: 3,
                  effect: ExpandingDotsEffect(
                    expansionFactor: 6,
                    dotHeight: 8.0,
                    dotWidth: 8.0,
                    activeDotColor: theme.primaryColor,
                    dotColor: theme.unselectedWidgetColor,
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              Text(
                bottomSelectedIndex == 0
                    ? title1
                    : bottomSelectedIndex == 1 ? title2 : title3,
                style: theme.textTheme.headline3,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15.0),
              Text(
                bottomSelectedIndex == 0
                    ? subtitle1
                    : bottomSelectedIndex == 1 ? subtitle2 : subtitle3,
                style: theme.textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25.0),
              SizedBox(
                width: Screen.width(context),
                height: 50.0,
                child: RaisedButton(
                  onPressed: onPressed,
                  color: theme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Text(
                    bottomSelectedIndex >= 2 ? 'Get Started' : 'Next',
                    style: theme.textTheme.button,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Positioned _onBoardingImages({String image1, String image2, String image3}) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      height: 400.0,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Image.asset(image1, fit: BoxFit.cover),
          Image.asset(image2, fit: BoxFit.cover),
          Image.asset(image3, fit: BoxFit.cover),
        ],
      ),
    );
  }
}

class Oval extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, 0);
    path.quadraticBezierTo(size.width / 2, size.height * 0.45, size.width, 0);
    path.quadraticBezierTo(
        size.width - size.width / 2, size.height * 0.45, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
