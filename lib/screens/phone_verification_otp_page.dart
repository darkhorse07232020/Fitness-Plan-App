import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:provider/provider.dart';

import '../helpers/screens.dart';
import '../helpers/toast.dart';
import '../providers/phone_verification_provider.dart';

class PhoneVerificationOTPPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final phoneVerifyProv = Provider.of<PhoneVerificationProvider>(context);

    // set your countdown time
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 1 * 60;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              Text(
                'Phone Verification',
                style: theme.textTheme.headline3,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25.0),
              Text(
                'Enter your OTP code here',
                style: theme.textTheme.subtitle2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.0),
              PinInputTextFormField(
                pinLength: 5,
                keyboardType: TextInputType.number,
                autoFocus: false,
                controller: phoneVerifyProv.codeCtrl,
                onChanged: (value) => phoneVerifyProv.onSavedCode(value),
                decoration: BoxLooseDecoration(
                  radius: Radius.circular(25.0),
                  textStyle: theme.textTheme.headline4,
                  strokeColorBuilder: PinListenColorBuilder(
                      theme.primaryColor, theme.accentColor),
                ),
              ),
              SizedBox(height: 30.0),
              CountdownTimer(
                textStyle: theme.textTheme.subtitle2,
                endTime: endTime,
                onEnd: () {
                  // Your code here
                  // if the time is up, it will call the function here
                  toast('reset code');
                },
              ),
              SizedBox(height: 30.0),
              Text(
                'Didn\'t you receive any code?',
                style: theme.textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.0),
              InkWell(
                onTap: () {
                  // this button allow user to resend verification code
                  toast('Resend a new verification code');
                },
                child: Text(
                  'Resend a new code',
                  style: theme.textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 18.0),
              SizedBox(
                width: Screen.width(context),
                child: RaisedButton(
                  onPressed: () {
                    // if user press this button
                    // system will process the verification
                    phoneVerifyProv.navigateToHomePage();
                  },
                  child: Text('Send', style: theme.textTheme.button),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
