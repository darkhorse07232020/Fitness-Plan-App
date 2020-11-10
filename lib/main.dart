import 'package:barbershopuikit/providers/change_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import 'helpers/theme.dart';
import 'providers/book_appointment_provider.dart';
import 'providers/filter_provider.dart';
import 'providers/forgot_password_provider.dart';
import 'providers/phone_verification_provider.dart';
import 'providers/sign_in_provider.dart';
import 'providers/sign_up_provider.dart';
import 'providers/theme_providers.dart';
import 'screens/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => SignInProvider()),
        ChangeNotifierProvider(create: (context) => SignUpProvider()),
        ChangeNotifierProvider(create: (context) => ForgotPasswordProvider()),
        ChangeNotifierProvider(
            create: (context) => PhoneVerificationProvider()),
        ChangeNotifierProvider(create: (context) => FilterProvider()),
        ChangeNotifierProvider(create: (context) => BookAppointmentProvider()),
        ChangeNotifierProvider(create: (context) => ChangePasswordProvider()),
      ],
      child: Consumer<ThemeProvider>(builder: (context, theme, snapshot) {
        return GetMaterialApp(
          title: 'Barbershop',
          theme: themeData(context),
          darkTheme: darkThemeData(context),
          themeMode: theme.isLightTheme ? ThemeMode.light : ThemeMode.dark,
          transitionDuration: Duration(milliseconds: 750),
          defaultTransition: Transition.topLevel,
          home: SplashPage(),
        );
      }),
    );
  }
}
