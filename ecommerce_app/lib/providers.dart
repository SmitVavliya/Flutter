import 'package:ecommerce_app/controllers/blocs/forgot_password_bloc.dart';
import 'package:ecommerce_app/controllers/blocs/signin_bloc.dart';
import 'package:ecommerce_app/controllers/blocs/signup_bloc.dart';
import 'package:ecommerce_app/controllers/providers/cart_provider.dart';
import 'package:ecommerce_app/controllers/providers/products_provider.dart';
import 'package:provider/provider.dart';
import "package:flutter/material.dart";
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = [
  Provider<SignInBloc>(
    create: (BuildContext context) => SignInBloc(),
  ),
  Provider<SignUpBloc>(
    create: (BuildContext context) => SignUpBloc(),
  ),
  Provider<ForgetPasswordBloc>(
    create: (BuildContext context) => ForgetPasswordBloc(),
  ),
  ChangeNotifierProvider<ProductsProvider>(
    create: (BuildContext context) => ProductsProvider(),
  ),
  ChangeNotifierProvider<CartProvider>(
    create: (BuildContext context) => CartProvider(),
  ),
];
