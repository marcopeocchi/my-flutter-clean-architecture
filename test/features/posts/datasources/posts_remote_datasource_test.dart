import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_flutter_clean_architecture/features/posts/data/datasources/posts_remote_datasource.dart';
import 'package:my_flutter_clean_architecture/features/posts/data/models/post_model.dart';

import '../../../fixtures/reader.dart';

class MockHttpClient extends Mock implements Dio {}

void main() {
  late PostsRemoteDatasource datasource;
  late MockHttpClient mock;

  final List<dynamic> jsonPosts = jsonDecode(fixture('posts.json'));
  final tPosts = jsonPosts
      .map<PostModel>(
        (obj) => PostModel.fromJson(obj),
      )
      .toList();

  setUp(() {
    mock = MockHttpClient();
    datasource = PostsRemoteDatasource(mock);
  });

  group('getRemotePosts', () {
    setUp(() {
      when(datasource.getPosts()).thenAnswer((_) async => tPosts);
    });
    test('should return a valid list of posts', () async {
      final res = await datasource.getPosts();
      expect(res.length, greaterThanOrEqualTo(0));
      expect(res, equals(tPosts));
    });
  });
}
