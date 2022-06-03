import 'package:flutter/material.dart';

// Get the proportionate height as per screen size
double getProportionateScreenHeight(BuildContext context, double inputHeight) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);
  double screenHeight = _mediaQueryData.size.height;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(BuildContext context, double inputWidth) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);
  double screenWidth = _mediaQueryData.size.width;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}

double getHeight(BuildContext context) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);
  return _mediaQueryData.size.height;
}

double getWidth(BuildContext context) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);
  return _mediaQueryData.size.width;
}
