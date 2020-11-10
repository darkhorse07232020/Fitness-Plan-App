import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../helpers/screens.dart';
import '../helpers/toast.dart';
import '../providers/sign_up_provider.dart';

class SignUpWithEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final signUpProv = Provider.of<SignUpProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            Text('Create an account', style: theme.textTheme.headline3),
            Text('Sign up to continue', style: theme.textTheme.subtitle2),
            SizedBox(height: 35.0),
            SizedBox(
              width: Screen.width(context),
              height: 45.0,
              child: TextFormField(
                style: theme.textTheme.bodyText2,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Username',
                  suffixIcon: Icon(FlutterIcons.user_fea),
                ),
              ),
            ),
            SizedBox(height: 12.0),
            SizedBox(
              width: Screen.width(context),
              height: 45.0,
              child: TextFormField(
                style: theme.textTheme.bodyText2,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email address',
                  suffixIcon: Icon(FlutterIcons.mail_fea),
                ),
              ),
            ),
            SizedBox(height: 12.0),
            GestureDetector(
              onTap: () {
                signUpProv.selectDate(context);
              },
              child: Container(
                width: Screen.width(context),
                height: 45.0,
                decoration: BoxDecoration(
                  border: Border.all(color: theme.unselectedWidgetColor),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          signUpProv.dateOfBirth == null
                              ? 'Date of Birth'
                              : "${signUpProv.dateOfBirth}",
                          style: signUpProv.dateOfBirth == null
                              ? theme.textTheme.subtitle2
                              : theme.textTheme.bodyText2),
                      Icon(FlutterIcons.calendar_fea,
                          color: theme.unselectedWidgetColor),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Container(
              width: Screen.width(context),
              height: 45.0,
              decoration: BoxDecoration(
                border: Border.all(color: theme.unselectedWidgetColor),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: DropdownButton(
                  isExpanded: true,
                  underline: Container(),
                  value: signUpProv.selectedGender,
                  style: theme.textTheme.bodyText2,
                  hint: Text('Gender', style: theme.textTheme.subtitle2),
                  iconDisabledColor: theme.unselectedWidgetColor,
                  items: signUpProv.genderItems
                      .map<DropdownMenuItem<String>>((e) =>
                          DropdownMenuItem<String>(
                            value: e,
                            child: Text(e, style: theme.textTheme.bodyText2),
                          ))
                      .toList(),
                  onChanged: (value) => signUpProv.selectedGender = value,
                ),
              ),
            ),
            SizedBox(height: 12.0),
            SizedBox(
              width: Screen.width(context),
              height: 45.0,
              child: TextFormField(
                style: theme.textTheme.bodyText2,
                obscureText: signUpProv.obscureText1,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(signUpProv.obscureText1
                        ? FlutterIcons.visibility_off_mdi
                        : FlutterIcons.visibility_mdi),
                    onPressed: () {
                      signUpProv.hidePassword();
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.0),
            SizedBox(
              width: Screen.width(context),
              height: 45.0,
              child: TextFormField(
                style: theme.textTheme.bodyText2,
                obscureText: signUpProv.obscureText2,
                decoration: InputDecoration(
                  hintText: 'Password again',
                  suffixIcon: IconButton(
                    icon: Icon(signUpProv.obscureText2
                        ? FlutterIcons.visibility_off_mdi
                        : FlutterIcons.visibility_mdi),
                    onPressed: () {
                      signUpProv.hidePasswordAgain();
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Row(
              children: [
                Checkbox(
                  value: signUpProv.isAccepted,
                  onChanged: (value) {
                    signUpProv.acceptTermsAndCondition();
                  },
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'By continuing Sign up you agree to the following our ',
                          style: theme.textTheme.subtitle2,
                        ),
                        TextSpan(
                          text: 'Terms',
                          style: theme.textTheme.headline5.copyWith(
                            color: theme.primaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => toast('Terms clicked!'),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: theme.textTheme.subtitle2,
                        ),
                        TextSpan(
                          text: 'Condition',
                          style: theme.textTheme.headline5.copyWith(
                            color: theme.primaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => toast('Condition clicked!'),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 35.0),
            SizedBox(
              width: Screen.width(context),
              child: RaisedButton(
                onPressed: () {
                  signUpProv.signUpFunction();
                },
                child: Text('Sign up', style: theme.textTheme.button),
              ),
            ),
            SizedBox(height: 15.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Already have an account?  ',
                    style: theme.textTheme.subtitle2),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    'Sign in',
                    style: theme.textTheme.headline5
                        .copyWith(color: theme.primaryColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.0),
          ],
        ),
      ),
    );
  }
}
