import 'package:dartz/dartz.dart';
import 'package:my_flutter_clean_architecture/core/error_handling/failure.dart';
import 'package:my_flutter_clean_architecture/features/posts/domain/entities/post_entity.dart';

abstract class PostsRepository {
  Future<Either<Failure, List<Post>>> getPosts();
}
