import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bloc_demo/screens/login_screen.dart';
import 'package:bloc_demo/bloc/register_bloc.dart';

import 'bloc/login_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(),
        ),
        Provider<RegisterBloc>(
          create: (BuildContext context) => RegisterBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
