import 'package:news/models/item_model.dart';
import 'package:news/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class StoriesBloc {
  final _repository = Repository();

  final _topIds = PublishSubject<List<int>>();
  final _itemsFetcher = PublishSubject<int>();
  final _itemsOutput = BehaviorSubject<Map<int, Future<ItemModel?>>>();

  StoriesBloc() {
    _itemsFetcher.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
  }

  Stream<List<int>> get topIds => _topIds.stream;
  Stream<Map<int, Future<ItemModel?>>> get items => _itemsOutput.stream;

  Function(int) get fetchItem => _itemsFetcher.sink.add;

  fetchTopIds() async {
    List<int>? ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids!);
  }

  _itemsTransformer() {
    return ScanStreamTransformer(
        (Map<int, Future<ItemModel?>> cache, int id, index) {
      cache[id] = _repository.fetchItem(id);
      return cache;
    }, <int, Future<ItemModel?>>{});
  }

  dispose() {
    _topIds.close();
    _itemsFetcher.close();
    _itemsOutput.close();
  }
}
