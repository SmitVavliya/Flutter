import "package:flutter/material.dart";
import 'package:news/blocs/stories_provider.dart';

import 'news_list.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NewsList(),
      ),
    );
  }
}
