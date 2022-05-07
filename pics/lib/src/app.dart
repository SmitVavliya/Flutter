import 'dart:convert';

import "package:flutter/material.dart";
import "package:http/http.dart" show get;
import 'package:pics/src/model/image_mode.dart';
import 'package:pics/src/widgets/image_list.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;
  final List<ImageModel> _images = [];

  void fetchImage() async {
    _counter++;
    Uri url =
        Uri.parse("https://jsonplaceholder.typicode.com/photos/$_counter");
    final res = await get(url);
    final image = ImageModel.fromJson(json.decode(res.body));
    setState(() {
      _images.add(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Let's See Some Images!"),
        ),
        body: ImageList(_images),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
