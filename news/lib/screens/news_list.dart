import "package:flutter/material.dart";
import 'package:news/blocs/stories_bloc.dart';
import 'package:news/blocs/stories_provider.dart';
import 'package:news/widgets/news_list_tile.dart';
import 'package:news/widgets/refresh.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Top News"),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        return Refresh(
          ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              bloc.fetchItem(snapshot.data![index]);

              return NewsListTile(snapshot.data![index]);
            },
          ),
        );
      },
    );
  }
}
