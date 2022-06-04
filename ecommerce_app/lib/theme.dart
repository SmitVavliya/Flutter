import 'package:ecommerce_app/animation_route.dart';
import 'package:ecommerce_app/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: AnimationRoute(),
      },
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: eTextColor),
    gapPadding: 10,
  );

  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: eTextColor),
    bodyText2: TextStyle(color: eTextColor),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    centerTitle: true,
    color: Colors.white,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.light,
    ),
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Color(0XFF8B8B8B),
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: "Muli",
    ),
  );
}
