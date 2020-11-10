import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../helpers/screens.dart';
import '../providers/sign_in_provider.dart';
import 'bottom_nav_bar_page.dart';
import 'forgot_password_page.dart';
import 'sign_up_with_email_page.dart';

class SignInWithEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final signInProv = Provider.of<SignInProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/other/2.png'),
          DraggableScrollableSheet(
            maxChildSize: 1.0,
            minChildSize: .7,
            initialChildSize: .7,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: theme.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.0),
                    topLeft: Radius.circular(25.0),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
                  child: Column(
                    children: [
                      Text(
                        'Welcome back',
                        style: theme.textTheme.headline2
                            .copyWith(color: theme.primaryColor),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Style that fit your lifestyle',
                        style: theme.textTheme.subtitle2,
                      ),
                      SizedBox(height: 50.0),
                      SizedBox(
                        width: Screen.width(context),
                        height: 45.0,
                        child: TextFormField(
                          style: theme.textTheme.bodyText2,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Email address',
                            suffixIcon: IconButton(
                              icon: Icon(FlutterIcons.user_fea),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      SizedBox(
                        width: Screen.width(context),
                        height: 45.0,
                        child: TextFormField(
                          style: theme.textTheme.bodyText2,
                          obscureText: signInProv.obscureText,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(signInProv.obscureText
                                  ? FlutterIcons.visibility_off_mdi
                                  : FlutterIcons.visibility_mdi),
                              onPressed: () {
                                signInProv.changeObscureText();
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 35.0),
                      SizedBox(
                        width: Screen.width(context),
                        child: RaisedButton(
                          onPressed: () {
                            Get.to(BottomNavigationBarPage());
                          },
                          child: Text('Login', style: theme.textTheme.button),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      InkWell(
                        borderRadius: BorderRadius.circular(15.0),
                        onTap: () {
                          Get.to(ForgotPasswordPage());
                        },
                        child: Text(
                          'Forgot your password?',
                          style: theme.textTheme.bodyText2,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: theme.textTheme.subtitle1,
                          ),
                          SizedBox(width: 5.0),
                          InkWell(
                            onTap: () {
                              Get.to(SignUpWithEmailPage());
                            },
                            child: Text(
                              'Sign Up',
                              style: theme.textTheme.headline5
                                  .copyWith(color: theme.primaryColor),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
