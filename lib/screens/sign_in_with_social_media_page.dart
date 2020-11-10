import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/colors.dart';
import '../helpers/screens.dart';
import '../helpers/toast.dart';
import 'sign_in_with_email_page.dart';

class SignInWithSocialMediaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _background(
        image: 'assets/images/other/1.jpg',
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          color: Colors.black54,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _logo(),
              SizedBox(height: 20.0),
              _content(context,
                  title: 'Book and Appointment\nfor Salon, Spa & Barber'),
              SizedBox(height: 30.0),
              socialSignInButton(
                context,
                socialMedia: 'Google',
                onPressed: () {
                  toast('Google Sign In Pressed');
                },
              ),
              SizedBox(height: 20.0),
              socialSignInButton(
                context,
                socialMedia: 'Facebook',
                onPressed: () {
                  toast('Facebook In Pressed');
                },
              ),
              SizedBox(height: 25.0),
              signInWithEmail(context, onPressed: () {
                Get.to(SignInWithEmailPage());
              }),
              SizedBox(height: 25.0),
            ],
          ),
        ),
      ),
    );
  }

  Center signInWithEmail(BuildContext context, {Function onPressed}) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Already have an account?  ', style: textTheme.subtitle2),
          GestureDetector(
            onTap: onPressed,
            child: Text(
              'Sign In',
              style: textTheme.headline5.copyWith(color: kBackgroundLightColor),
            ),
          ),
        ],
      ),
    );
  }

  _content(BuildContext context, {String title}) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: theme.textTheme.headline2.copyWith(color: kBackgroundLightColor),
    );
  }

  Container _logo() {
    return Container(
      width: 50.0,
      height: 50.0,
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        image: DecorationImage(
          image: AssetImage(
            'assets/icons/logo.png',
          ),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Container _background({Widget child, String image}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }

  socialSignInButton(BuildContext context,
      {Function onPressed, String socialMedia}) {
    final theme = Theme.of(context);
    return SizedBox(
      width: Screen.width(context),
      height: 50.0,
      child: Stack(
        children: <Widget>[
          RaisedButton(
            onPressed: onPressed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: socialMedia == 'Google' ? kErrorLightColor : kBlueColor,
            child: Center(
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Connect with ', style: theme.textTheme.button),
                  TextSpan(
                      text: '$socialMedia',
                      style: theme.textTheme.headline3
                          .copyWith(color: kBackgroundLightColor)),
                ]),
              ),
            ),
          ),
          Positioned(
            left: 25.0,
            top: 12.0,
            bottom: 12.0,
            child: Image.asset(
              'assets/icons/$socialMedia.png',
              color: kBackgroundLightColor,
            ),
          ),
        ],
      ),
    );
  }
}
