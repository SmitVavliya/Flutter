import 'package:ecommerce_app/controllers/blocs/forgot_password_bloc.dart';
import 'package:ecommerce_app/controllers/blocs/signin_bloc.dart';
import 'package:ecommerce_app/controllers/blocs/signup_bloc.dart';
import 'package:provider/provider.dart';
import "package:flutter/material.dart";

final List<Provider> providers = [
  Provider<SignInBloc>(
    create: (BuildContext context) => SignInBloc(),
  ),
  Provider<SignUpBloc>(
    create: (BuildContext context) => SignUpBloc(),
  ),
  Provider<ForgetPasswordBloc>(
    create: (BuildContext context) => ForgetPasswordBloc(),
  )
];
