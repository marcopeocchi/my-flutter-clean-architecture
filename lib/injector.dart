import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_flutter_clean_architecture/features/posts/data/datasources/posts_remote_datasource.dart';
import 'package:my_flutter_clean_architecture/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:my_flutter_clean_architecture/features/posts/domain/repositories/posts_repository.dart';
import 'package:my_flutter_clean_architecture/features/posts/domain/usecases/get_all_posts.dart';
import 'package:my_flutter_clean_architecture/features/posts/presentation/store/posts_store.dart';

class DependencyInjector {
  // Service locator
  static final sl = GetIt.instance;

  static Future<void> init() async {
    sl.registerFactory(() => PostsStore(sl()));

    sl.registerLazySingleton(() => GetAllPosts(sl()));

    sl.registerLazySingleton<PostsRepository>(
      () => PostsRepositoryImpl(remoteDatasource: sl()),
    );

    sl.registerLazySingleton(() => PostsRemoteDatasource(sl()));

    sl.registerLazySingleton(() => Dio());
  }
}