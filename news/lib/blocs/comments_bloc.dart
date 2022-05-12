import 'package:news/models/item_model.dart';
import 'package:news/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class CommentsBloc {
  final _repository = Repository();

  final _commentsFetcher = PublishSubject<int>();
  final _commentsOutput = BehaviorSubject<Map<int, Future<ItemModel?>>>();

  CommentsBloc() {
    _commentsFetcher.stream
        .transform(_commentsTransformer())
        .pipe(_commentsOutput);
  }

  Stream<Map<int, Future<ItemModel?>>> get itemWithComments =>
      _commentsOutput.stream;

  Function(int) get fetchItemWithComments => _commentsFetcher.sink.add;

  _commentsTransformer() {
    return ScanStreamTransformer(
        (Map<int, Future<ItemModel?>> cache, int id, index) {
      cache[id] = _repository.fetchItem(id);
      cache[id]?.then((ItemModel? item) {
        for (int kidId in item!.kids) {
          fetchItemWithComments(kidId);
        }
      });
      return cache;
    }, <int, Future<ItemModel?>>{});
  }

  dispose() {
    _commentsFetcher.close();
    _commentsOutput.close();
  }
}
