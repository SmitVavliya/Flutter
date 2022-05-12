import "package:flutter/material.dart";
import 'package:news/blocs/comments_provider.dart';
import 'package:news/blocs/stories_provider.dart';
import 'package:news/screens/news_details.dart';

import 'news_list.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommentsProvider(
      child: StoriesProvider(
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: routes,
        ),
      ),
    );
  }
}

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case "/details":
      final int id = (settings.arguments as Map)["id"];

      return MaterialPageRoute(builder: (BuildContext context) {
        final bloc = CommentsProvider.of(context);
        bloc.fetchItemWithComments(id);

        return NewsDetails(id);
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        final bloc = StoriesProvider.of(context);
        bloc.fetchTopIds();

        return const NewsList();
      });
  }
}
