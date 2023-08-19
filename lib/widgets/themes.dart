import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class AppThemes {
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.purple400;
  static String noImageFound =
      "https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg";

  static ThemeData lightTheme(BuildContext context) => ThemeData(
      // brightness: Brightness.light,
      buttonTheme: ButtonThemeData(
          colorScheme: context.theme.colorScheme
              .copyWith(primary: darkBluishColor, secondary: darkBluishColor)),
      cardColor: Colors.white,
      canvasColor: creamColor,
      primarySwatch: Colors.purple,
      colorScheme: context.theme.colorScheme.copyWith(
          primary: darkBluishColor
      ),
      appBarTheme: AppBarTheme(
          color: creamColor,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: GoogleFonts.poppins().fontFamily)),
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          bodyLarge: TextStyle(
        color: Colors.white,
      )));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      // brightness: Brightness.dark,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      colorScheme: context.theme.colorScheme.copyWith(
        primary: Colors.white
      ),
      buttonTheme: ButtonThemeData(
          colorScheme: context.theme.colorScheme
              .copyWith(primary: lightBluishColor, secondary: Colors.white)),
      appBarTheme: AppBarTheme(
          color: darkCreamColor,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: GoogleFonts.poppins().fontFamily)),
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          bodyLarge: TextStyle(
        color: Colors.white,
      )));
}
