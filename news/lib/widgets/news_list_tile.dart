// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";
import 'package:news/blocs/stories_provider.dart';
import 'package:news/models/item_model.dart';
import 'package:news/widgets/loading_container.dart';

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
          return const LoadingContainer();
        }

        return FutureBuilder(
          future: snapshot.data![itemId],
          builder:
              (BuildContext context, AsyncSnapshot<ItemModel?> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return const LoadingContainer();
            }

            return buildTile(context, itemSnapshot.data!);
          },
        );
      },
    );
  }

  Widget buildTile(BuildContext context, ItemModel item) {
    return Column(
      children: [
        ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(item.title),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text('${item.score} points by ${item.by}'),
          ),
          trailing: Column(
            children: <Widget>[
              const Icon(Icons.comment),
              Text('${item.descendants}'),
            ],
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              "/details",
              arguments: {"id": item.id},
            );
          },
        ),
        const Divider(thickness: 1.1, height: 10),
      ],
    );
  }
}
