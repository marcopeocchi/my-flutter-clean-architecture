// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostsStore on _PostsStoreBase, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state,
              name: '_PostsStoreBase.state'))
          .value;

  late final _$postsAtom =
      Atom(name: '_PostsStoreBase.posts', context: context);

  @override
  List<Post>? get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(List<Post>? value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_PostsStoreBase.error', context: context);

  @override
  Failure? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(Failure? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$getAllPostsAsyncAction =
      AsyncAction('_PostsStoreBase.getAllPosts', context: context);

  @override
  Future<dynamic> getAllPosts() {
    return _$getAllPostsAsyncAction.run(() => super.getAllPosts());
  }

  @override
  String toString() {
    return '''
posts: ${posts},
error: ${error},
state: ${state}
    ''';
  }
}
