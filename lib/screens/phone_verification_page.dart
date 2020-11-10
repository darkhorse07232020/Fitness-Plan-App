import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../helpers/screens.dart';
import '../providers/phone_verification_provider.dart';
import 'sign_in_with_social_media_page.dart';

class PhoneVerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final phoneVerifyProv = Provider.of<PhoneVerificationProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            Image.asset('assets/images/illustrations/2.png'),
            SizedBox(height: 35.0),
            Text('Verify Phone Number', style: theme.textTheme.headline3),
            SizedBox(height: 15.0),
            Text(
              'We have sent you an SMS with a code to number +${phoneVerifyProv.countryCode}${phoneVerifyProv.phoneNumber}',
              style: theme.textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25.0),
            Container(
              width: Screen.width(context),
              height: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: theme.unselectedWidgetColor),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      phoneVerifyProv.openCountryPickerDialog(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 18.0),
                      child: phoneVerifyProv.countryAndCode(context,
                          country: phoneVerifyProv.selectedDialogCountry),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      style: theme.textTheme.bodyText2,
                      controller: phoneVerifyProv.phoneCtrl,
                      keyboardType: TextInputType.number,
                      onChanged: (value) =>
                          phoneVerifyProv.onSavedPhoneNumber(value),
                      decoration: InputDecoration(
                        hintText: 'Phone number',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            phoneVerifyProv.clear();
                          },
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35.0),
            // if user want sign up with social media
            // will press di navigation button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Or Login with', style: theme.textTheme.subtitle2),
                InkWell(
                  onTap: () {
                    Get.to(SignInWithSocialMediaPage());
                  },
                  child: Text(
                    ' Social Network',
                    style: theme.textTheme.headline5
                        .copyWith(color: theme.primaryColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35.0),
            SizedBox(
              width: Screen.width(context),
              child: RaisedButton(
                onPressed: () {
                  phoneVerifyProv.navigateToOTPScreen();
                },
                child: Text('Continue', style: theme.textTheme.button),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
