import 'package:mobx/mobx.dart';
import 'package:my_flutter_clean_architecture/core/error_handling/failure.dart';
import 'package:my_flutter_clean_architecture/features/posts/domain/entities/post_entity.dart';
import 'package:my_flutter_clean_architecture/features/posts/domain/usecases/get_all_posts.dart';

part 'posts_store.g.dart';

enum StoreState { initial, loading, loaded }

class PostsStore extends _PostsStoreBase with _$PostsStore {
  PostsStore(
    GetAllPosts getAllPosts,
  ) : super(getAllPosts);
}

abstract class _PostsStoreBase with Store {
  final GetAllPosts _getAllPosts;

  _PostsStoreBase(this._getAllPosts);

  @observable
  List<Post>? posts;

  @observable
  Failure? error;

  @computed
  StoreState get state {
    if (posts == null) return StoreState.loading;
    return posts!.isEmpty ? StoreState.initial : StoreState.loaded;
  }

  @action
  Future getAllPosts() async {
    final res = await _getAllPosts(Params());
    res.fold(
      (l) => error = l,
      (r) => posts = r,
    );
  }
}
