import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    appBarTheme: AppBarTheme(color: kBackgroundLightColor, elevation: 0),
    primaryColor: kPrimaryColor,
    buttonColor: kPrimaryColor,
    primaryColorLight: kBackgroundDarkColor,
    accentColor: kAccentLightColor,
    errorColor: kErrorLightColor,
    hintColor: kSecondaryLightColor,
    cardColor: kCardLightColor,
    brightness: Brightness.light,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: kPrimaryColor,
    ),
    unselectedWidgetColor: kSecondaryLightColor,
    scaffoldBackgroundColor: kBackgroundLightColor,
    backgroundColor: kBackgroundLightColor,
    iconTheme: IconThemeData(color: kBackgroundDarkColor),
    primaryIconTheme: IconThemeData(color: kBackgroundDarkColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    indicatorColor: kPrimaryColor,
    buttonTheme: ButtonThemeData(
      minWidth: 120.0,
      height: 45.0,
      buttonColor: kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
      hintStyle: GoogleFonts.openSans(
        color: kSecondaryLightColor,
        fontSize: 12.0,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: kSecondaryLightColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: kPrimaryColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: kErrorLightColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: kErrorLightColor,
        ),
      ),
      errorStyle: GoogleFonts.openSans(
        color: kErrorDarkColor,
        fontSize: 12.0,
      ),
    ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      headline1: GoogleFonts.poppins(
        color: kBackgroundDarkColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headline2: GoogleFonts.poppins(
        color: kBackgroundDarkColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headline3: GoogleFonts.poppins(
        color: kBackgroundDarkColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      headline4: GoogleFonts.poppins(
        color: kBackgroundDarkColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      headline5: GoogleFonts.poppins(
        color: kBackgroundDarkColor,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: GoogleFonts.poppins(
        color: kBackgroundDarkColor,
        fontSize: 16.0,
      ),
      bodyText2: GoogleFonts.openSans(
        color: kBackgroundDarkColor,
        fontSize: 14.0,
      ),
      subtitle1: GoogleFonts.openSans(
        color: kSecondaryLightColor,
        fontSize: 14.0,
      ),
      subtitle2: GoogleFonts.openSans(
        color: kSecondaryLightColor,
        fontSize: 12.0,
      ),
      button: GoogleFonts.roboto(
        color: kPrimaryDarkColor,
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

// Dark Theme
ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    accentColor: kAccentDarkColor,
    buttonColor: kPrimaryColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: kPrimaryColor,
    ),
    primaryColorLight: kBackgroundLightColor,
    hintColor: kSecondaryDarkColor,
    cardColor: kCardDarkColor,
    errorColor: kErrorDarkColor,
    brightness: Brightness.dark,
    indicatorColor: kPrimaryColor,
    unselectedWidgetColor: kSecondaryDarkColor,
    scaffoldBackgroundColor: kBackgroundDarkColor,
    appBarTheme: AppBarTheme(color: kBackgroundDarkColor, elevation: 0.0),
    backgroundColor: kBackgroundDarkColor,
    iconTheme: IconThemeData(color: kPrimaryColor),
    primaryIconTheme: IconThemeData(color: kPrimaryColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    buttonTheme: ButtonThemeData(
      minWidth: 120.0,
      height: 45.0,
      buttonColor: kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
      hintStyle: GoogleFonts.openSans(
        color: kSecondaryDarkColor,
        fontSize: 12.0,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: kSecondaryDarkColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: kPrimaryColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: kErrorDarkColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: kErrorDarkColor,
        ),
      ),
      errorMaxLines: 1,
      helperStyle: GoogleFonts.openSans(
        color: kSecondaryDarkColor,
        fontSize: 10.0,
      ),
      errorStyle: GoogleFonts.openSans(
        color: kErrorDarkColor,
        fontSize: 10.0,
      ),
    ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      headline1: GoogleFonts.poppins(
        color: kPrimaryDarkColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headline2: GoogleFonts.poppins(
        color: kPrimaryDarkColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headline3: GoogleFonts.poppins(
        color: kPrimaryDarkColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      headline4: GoogleFonts.poppins(
        color: kPrimaryDarkColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      headline5: GoogleFonts.poppins(
        color: kPrimaryDarkColor,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: GoogleFonts.poppins(
        color: kPrimaryDarkColor,
        fontSize: 16.0,
      ),
      bodyText2: GoogleFonts.poppins(
        color: kPrimaryDarkColor,
        fontSize: 14.0,
      ),
      subtitle1: GoogleFonts.openSans(
        color: kSecondaryDarkColor,
        fontSize: 14.0,
      ),
      subtitle2: GoogleFonts.openSans(
        color: kSecondaryDarkColor,
        fontSize: 12.0,
      ),
      button: GoogleFonts.roboto(
        color: kPrimaryDarkColor,
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

AppBarTheme appBarTheme = AppBarTheme(color: Colors.transparent, elevation: 0);
