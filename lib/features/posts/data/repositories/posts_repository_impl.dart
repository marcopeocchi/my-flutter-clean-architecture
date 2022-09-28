import 'package:my_flutter_clean_architecture/core/network/network_info.dart';
import 'package:my_flutter_clean_architecture/features/posts/data/datasources/posts_local_datasource.dart';
import 'package:my_flutter_clean_architecture/features/posts/data/datasources/posts_remote_datasource.dart';
import 'package:my_flutter_clean_architecture/features/posts/domain/entities/post_entity.dart';
import 'package:my_flutter_clean_architecture/core/error_handling/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:my_flutter_clean_architecture/features/posts/domain/repositories/posts_repository.dart';

class PostsRepositoryImpl extends PostsRepository {
  final PostsRemoteDatasource remoteDatasource;
  final PostsLocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  PostsRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Post>>> getPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final posts = await remoteDatasource.getPosts();

        for (final post in posts) {
          localDatasource.cachePost(post);
        }

        final entities = posts
            .map((post) => Post(title: post.title, body: post.body))
            .toList();
        return Right(entities);
      } catch (_) {
        return const Left(RestApiFailure());
      }
    }
    try {
      final posts = await localDatasource.getPosts();
      final entities = posts
          .map((post) => Post(title: post.title, body: post.body))
          .toList();
      return Right(entities);
    } catch (_) {
      return const Left(LocalCacheFailure());
    }
  }
}
