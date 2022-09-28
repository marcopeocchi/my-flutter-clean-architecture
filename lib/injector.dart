import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_flutter_clean_architecture/core/network/network_info.dart';
import 'package:my_flutter_clean_architecture/core/utils/db/init_db.dart';
import 'package:my_flutter_clean_architecture/features/posts/data/datasources/posts_local_datasource.dart';
import 'package:my_flutter_clean_architecture/features/posts/data/datasources/posts_remote_datasource.dart';
import 'package:my_flutter_clean_architecture/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:my_flutter_clean_architecture/features/posts/domain/repositories/posts_repository.dart';
import 'package:my_flutter_clean_architecture/features/posts/domain/usecases/get_all_posts.dart';
import 'package:my_flutter_clean_architecture/features/posts/presentation/store/posts_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjector {
  // Service locator
  static final sl = GetIt.instance;

  static Future<void> init() async {
    sl.registerFactory(() => PostsStore(sl()));

    sl.registerLazySingleton(() => GetAllPosts(sl()));

    sl.registerLazySingleton<PostsRepository>(
      () => PostsRepositoryImpl(
        remoteDatasource: sl(),
        localDatasource: sl(),
        networkInfo: sl(),
      ),
    );

    sl.registerLazySingleton(() => PostsRemoteDatasource(sl()));

    final db = await LocalDBUtils.init(devMode: true);
    sl.registerLazySingleton(() => db);

    sl.registerLazySingleton<PostsLocalDatasource>(
      () => PostsLocalDatasourceImpl(sl()),
    );

    sl.registerLazySingleton(
      () => Dio()
        ..interceptors.add(
          DioLoggingInterceptor(
            level: Level.headers,
          ),
        ),
    );

    sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()),
    );

    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
  }
}
