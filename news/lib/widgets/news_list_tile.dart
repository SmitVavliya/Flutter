// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";
import 'package:news/blocs/stories_provider.dart';
import 'package:news/models/item_model.dart';

class NewsListTile extends StatelessWidget {
  late int itemId;

  NewsListTile(this.itemId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    return StreamBuilder(
      stream: bloc.items,
      builder: (BuildContext context,
          AsyncSnapshot<Map<int, Future<ItemModel?>>> snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        return FutureBuilder(
          future: snapshot.data![itemId],
          builder:
              (BuildContext context, AsyncSnapshot<ItemModel?> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return const CircularProgressIndicator();
            }

            return ListTile(title: Text(itemSnapshot.data!.title));
          },
        );
      },
    );
  }
}
