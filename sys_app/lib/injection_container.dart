import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sys_app/core/network/logging_interceptor.dart';
import 'package:sys_app/core/network/network_info.dart';
import 'package:sys_app/features/data/datasources/post_local_data_source.dart';
import 'package:sys_app/features/data/datasources/post_remote_data_source.dart';
import 'package:sys_app/features/data/repositories/post_repository_impl.dart';
import 'package:sys_app/features/domain/repositories/posts_repository.dart';
import 'package:sys_app/features/domain/usecases/get_all_posts.dart';
import 'package:sys_app/features/presentation/bloc/posts/posts_bloc.dart';

final sl = GetIt.instance; // Инициализация контейнера зависимостей

Future<void> init() async {
  //Bloc

  sl.registerFactory(() => PostsBloc(getAllPosts: sl()));

  //Usecases

  sl.registerLazySingleton(() => GetAllPostsUsecase(sl()));

  //Repository

  sl.registerLazySingleton<PostsRepository>(
    () => PostsRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Datasources

  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(sl<Dio>()),
  );
  sl.registerLazySingleton<PostLocalDataSource>(
    () => PostLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker.createInstance());
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.interceptors.add(LoggingInterceptor()); // Добавление логгирования
    return dio;
  });
}
