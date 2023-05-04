import 'package:feedme/theme/colors.dart';
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: 'NunitoSans',
  scaffoldBackgroundColor: scaffoldBackgroundColor,
  primaryColor: primaryColor,
  iconTheme: const IconThemeData(
    size: 20,
    color: blackColor,
  ),
  appBarTheme: const AppBarTheme(
    foregroundColor: blackColor,
    color: Colors.transparent,
    elevation: 0.0,
    centerTitle: true,
  ),

  //text theme
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
        color: blackColor, fontSize: 14.6, fontWeight: FontWeight.w600),
    headlineMedium:
        TextStyle(color: blackColor, fontSize: 15, fontWeight: FontWeight.w700),
    headlineLarge:
        TextStyle(color: blackColor, fontSize: 20, fontWeight: FontWeight.w700),
    titleSmall:
        TextStyle(color: blackColor, fontSize: 12, fontWeight: FontWeight.w400),
    titleMedium:
        TextStyle(color: blackColor, fontSize: 15, fontWeight: FontWeight.w500),
    titleLarge:
        TextStyle(color: blackColor, fontSize: 20, fontWeight: FontWeight.w700),
    displaySmall: TextStyle(color: blackColor, fontSize: 12),
    displayMedium: TextStyle(color: blackColor, fontSize: 15),
    displayLarge: TextStyle(color: blackColor, fontSize: 20),
    labelSmall:
        TextStyle(color: blackColor, fontSize: 12, fontWeight: FontWeight.w600),
    labelMedium:
        TextStyle(color: blackColor, fontSize: 15, fontWeight: FontWeight.w600),
  ),
);
