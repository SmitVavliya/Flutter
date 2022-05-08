import 'dart:io';

import 'package:news/models/item_model.dart';
import 'package:news/resources/repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";

class NewsDbProvider implements Source, Cache {
  late Database db;

  NewsDbProvider() {
    init();
  }

  init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "items.db");
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute(
            "CREATE TABLE Items(id INTEGER PRIMARY KEY, deleted INTEGER, type TEXT, by TEXT, time INTEGER, text TEXT, dead INTEGER, parent INTEGER, kids BLOB, url TEXT, score INTEGER, title INTEGER, descendants INTEGER)");
      },
    );
  }

  @override
  Future<List<int>>? fetchTopIds() {
    return null;
  }

  @override
  Future<ItemModel?> fetchItem(int id) async {
    final maps = await db.query(
      "Items",
      columns: ["*"],
      where: "id = ?",
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return ItemModel.fromDb(maps.first);
    }

    return null;
  }

  @override
  Future<int> addItem(ItemModel item) {
    return db.insert(
      "Items",
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }
}

final newsDbProvider = NewsDbProvider();
