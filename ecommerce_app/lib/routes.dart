import 'package:ecommerce_app/views/screens/auth/forgot_password_screen.dart';
import 'package:ecommerce_app/views/screens/auth/signin_screen.dart';
import 'package:ecommerce_app/views/screens/auth/signup_screen.dart';
import 'package:ecommerce_app/views/screens/details/details_screen.dart';
import 'package:ecommerce_app/views/screens/main_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (BuildContext context) => SignInScreen(),
  SignUpScreen.routeName: (BuildContext context) => SignUpScreen(),
  ForgotPasswordScreen.routeName: (BuildContext context) =>
      ForgotPasswordScreen(),
  MainScreen.routeName: (BuildContext context) => MainScreen(),
  DetailsScreen.routeName: (BuildContext context) => DetailsScreen(),
};
