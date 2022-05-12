import "package:flutter/material.dart";
import 'package:news/widgets/loading_container.dart';

import '../models/item_model.dart';

class Comment extends StatelessWidget {
  final int id;
  final Map<int, Future<ItemModel?>> itemMap;
  final int depth;

  const Comment(this.id, this.itemMap, this.depth, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: itemMap[id],
      builder: (BuildContext context, AsyncSnapshot<ItemModel?> snapshot) {
        if (!snapshot.hasData) {
          return const LoadingContainer();
        }

        final item = snapshot.data!;
        final children = <Widget>[
          ListTile(
            title: buildText(item),
            subtitle: item.by != "" ? Text(item.by) : const Text("Deleted"),
            contentPadding: EdgeInsets.only(
              right: 16,
              left: depth * 16,
            ),
          ),
          const Divider(thickness: 1.1),
        ];
        for (int kidId in item.kids) {
          children.add(Comment(kidId, itemMap, depth + 1));
        }

        return Column(children: children);
      },
    );
  }

  Widget buildText(ItemModel item) {
    final text = item.text
        .replaceAll("&#x27;", "'")
        .replaceAll('<p>', '\n\n')
        .replaceAll("</p>", "");

    return Text(text);
  }
}
