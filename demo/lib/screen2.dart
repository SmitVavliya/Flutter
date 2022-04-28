// ignore_for_file: prefer_const_constructors
// ignore_for_file: avoid_print
// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:demo/my_home_app.dart';
import "package:flutter/material.dart";

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  static const routeName = "/screen-2";

  @override
  Widget build(BuildContext context) {
    var arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    return Scaffold(
      body: Center(
        child: Text(arguments["message"].toString()),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => MyHomeApp(),
          ),
        ),
      ),
    );
  }
}
