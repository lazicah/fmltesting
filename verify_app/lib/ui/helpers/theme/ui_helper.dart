import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UIhelper {
  UIhelper._();

  static String appName = "Verify App";

  //Reusable Spacers
  static const kPaddingS = 8.0;
  static const kPaddingM = 24.0;
  static const kPaddingL = 32.0;

  ///Light Theme
  static ThemeData lightTheme() {
    final base = ThemeData.light();
    return ThemeData(
      accentColor: const Color(0xFF0466C8),
      primaryColor: const Color(0xFF0466C8),
      textTheme: base.textTheme.copyWith(
        bodyText1: GoogleFonts.sourceSansPro(
            fontSize: 16.0, fontWeight: FontWeight.normal),
        button: GoogleFonts.sourceSansPro(
            fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
        headline6: GoogleFonts.sourceSansPro(fontSize: 14.0),
        headline5: GoogleFonts.sourceSansPro(
          fontSize: 24.0,
        ),
        headline4:
            GoogleFonts.roboto(fontSize: 32.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  ///Dark Theme
  static ThemeData darkTheme() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(
          brightness: Brightness.dark, elevation: 0, color: Colors.transparent),
    );
  }

  /// A constant that is true if the application was compiled to run on the web.
  ///
  /// This implementation takes advantage of the fact that JavaScript does not
  /// support integers. In this environment, Dart's doubles and ints are
  /// backed by the same kind of object. Thus a double `0.0` is identical
  /// to an integer `0`. This is not true for Dart code running in AOT or on the
  /// VM.
  static final bool kIsWeb = identical(0, 0.0);

  /// Using letter spacing in Flutter for Web can cause a performance drop,
  /// see https://github.com/flutter/flutter/issues/51234.
  static double letterSpacingOrNone(double letterSpacing) =>
      kIsWeb ? 0.0 : letterSpacing;
}
