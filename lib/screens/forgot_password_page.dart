import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../helpers/screens.dart';
import '../helpers/toast.dart';
import '../providers/forgot_password_provider.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final forgotProv = Provider.of<ForgotPasswordProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/illustrations/1.png'),
              Text(
                'Forgot password',
                style: theme.textTheme.headline3,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15.0),
              Text(
                'Please enter your email address. You will receive a code to create a new password via email',
                style: theme.textTheme.subtitle2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 45.0),
              SizedBox(
                width: Screen.width(context),
                height: 45.0,
                child: TextField(
                  style: theme.textTheme.bodyText2,
                  keyboardType: TextInputType.emailAddress,
                  controller: forgotProv.emailCtrl,
                  onChanged: (value) => forgotProv.onSavedEmail(value),
                  decoration: InputDecoration(
                    hintText: 'Email address',
                    suffixIcon: IconButton(
                      icon: Icon(FlutterIcons.mail_fea),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.0),
              SizedBox(
                width: Screen.width(context),
                child: RaisedButton(
                  onPressed: () {
                    if (forgotProv.email == '') {
                      toast('Please fill your email address');
                    } else {
                      showAlertDialog(context);
                    }
                  },
                  child: Text('Reset password', style: theme.textTheme.button),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future showAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
            ),
            width: Screen.width(context),
            height: 280.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/send.svg'),
                SizedBox(height: 15.0),
                Text(
                  'Code has been sent to reset a new password.',
                  style: theme.textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25.0),
                Text(
                  'You\'ll shortly receive an email with a code to setup a new password',
                  style: theme.textTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25.0),
                SizedBox(
                  width: Screen.width(context),
                  child: RaisedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Done', style: theme.textTheme.button),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
