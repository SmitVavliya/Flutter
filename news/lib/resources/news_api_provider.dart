import 'dart:convert';

import "package:http/http.dart" show Client;
import 'package:news/models/item_model.dart';
import 'package:news/resources/repository.dart';

const String _baseUrl = "https://hacker-news.firebaseio.com/v0";

class NewsApiProvider implements Source {
  Client client = Client();

  @override
  Future<List<int>> fetchTopIds() async {
    Uri url = Uri.parse("$_baseUrl/topstories.json");
    final res = await client.get(url);
    final ids = json.decode(res.body).cast<int>();

    return ids;
  }

  @override
  Future<ItemModel> fetchItem(int id) async {
    Uri url = Uri.parse("$_baseUrl/item/$id.json");
    final res = await client.get(url);
    final parsedJson = json.decode(res.body);

    return ItemModel.fromJson(parsedJson);
  }
}
