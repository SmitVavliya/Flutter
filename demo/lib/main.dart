// ignore_for_file: prefer_const_constructors
import 'package:demo/screen2.dart';
import "package:flutter/material.dart";

import "./my_home_app.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue, // background (button) color
            onPrimary: Colors.white, // foreground (text) color
            // onSurface: Colors.red, // Disable color
            // side: BorderSide(color: Colors.red, width: 1),
          ),
        ),
      ),
      home: MyHomeApp(),
      routes: {
        Screen2.routeName: (BuildContext context) => Screen2(),
      },
    );
  }
}
