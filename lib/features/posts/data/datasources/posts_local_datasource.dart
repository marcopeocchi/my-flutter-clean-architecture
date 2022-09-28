import 'dart:convert';

import 'package:my_flutter_clean_architecture/features/posts/data/models/post_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class PostsLocalDatasource {
  Future<List<PostModel>> getPosts();
  Future<void> cachePost(PostModel post);
}

class PostsLocalDatasourceImpl implements PostsLocalDatasource {
  final Database db;

  PostsLocalDatasourceImpl(this.db);

  @override
  Future<List<PostModel>> getPosts() async {
    final res = await db.rawQuery('SELECT * FROM Posts');
    return res.map<PostModel>((record) {
      final String row = record['jsonField']!.toString();
      final Map<String, dynamic> jsonField = jsonDecode(row);
      return PostModel.fromJson(jsonField);
    }).toList();
  }

  @override
  Future<void> cachePost(PostModel post) async {
    await db.rawInsert(
      'INSERT OR IGNORE INTO Posts (post_id, jsonField) VALUES (?,?)',
      [post.id, jsonEncode(post.toJson())],
    );
  }
}
