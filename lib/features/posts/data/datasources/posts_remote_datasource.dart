import 'package:dio/dio.dart';
import 'package:my_flutter_clean_architecture/features/posts/data/models/post_model.dart';
import 'package:retrofit/retrofit.dart';

part 'posts_remote_datasource.g.dart';

@RestApi(baseUrl: 'https://gorest.co.in/public/v2')
abstract class PostsRemoteDatasource {
  factory PostsRemoteDatasource(Dio dio, {String baseUrl}) =
      _PostsRemoteDatasource;

  @GET('/posts')
  Future<List<PostModel>> getPosts();
}
