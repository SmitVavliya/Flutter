import 'package:flutter/material.dart';

const eBackgroundColor = Colors.black;
const ePrimaryColor = Color(0xFFFF7643);
const ePrimaryLightColor = Color(0xFFFFECDF);
const ePrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const eSecondaryColor = Color(0xFF979797);
const eTextColor = Color(0xFF757575);

const eAnimationDuration = Duration(milliseconds: 200);

const emailRegex =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
const passwordRegex =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
const nameRegex = r'^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$';
const userNameRegex = r'^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$';

const defaultUserImage =
    "https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png";
