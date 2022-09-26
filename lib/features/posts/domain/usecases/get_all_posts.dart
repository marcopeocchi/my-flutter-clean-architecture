import 'package:my_flutter_clean_architecture/core/error_handling/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:my_flutter_clean_architecture/core/usecase.dart';
import 'package:my_flutter_clean_architecture/features/posts/domain/entities/post_entity.dart';
import 'package:my_flutter_clean_architecture/features/posts/domain/repositories/posts_repository.dart';

class GetAllPosts implements Usecase<List<Post>, Params> {
  final PostsRepository repository;

  GetAllPosts(this.repository);

  @override
  Future<Either<Failure, List<Post>>> call(Params params) async {
    return await repository.getPosts();
  }
}

class Params extends NoParams {}
