import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wikipedia/ui/res/colors.dart';

TextTheme lightTextTheme = TextTheme(
//body1: TextStyle(color: LightColor.titleTextColor),
  headline1: TextStyle(
// top most head title
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  headline2: TextStyle(
// top most head title

    fontSize: 22.0,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  ),
  headline3: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      letterSpacing: 1),
  subtitle1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      letterSpacing: 1),
  subtitle2: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      letterSpacing: 1),
  headline4: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      letterSpacing: 1),
  headline5: TextStyle(
      fontSize: 14.0,
      fontStyle: FontStyle.normal,
      color: Colors.black,
      letterSpacing: 1),
  headline6: TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w200,
      color: Colors.black,
      letterSpacing: 1),
  bodyText1: TextStyle(
// cardtext line one
      fontSize: 14.0,
      fontStyle: FontStyle.normal,
      color: Colors.black,
      letterSpacing: 1),
  bodyText2: TextStyle(
      fontSize: 15.0,
      fontStyle: FontStyle.normal,
      color: Colors.grey,
      letterSpacing: 1),
);

class ThemeChanger {
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    accentColor: accentColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    textTheme: GoogleFonts.robotoTextTheme(lightTextTheme),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
  );

}
