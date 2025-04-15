import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sys_app/core/network/network_info.dart';
import 'package:sys_app/features/data/repositories/post_repository_impl.dart';
import 'package:sys_app/features/domain/repositories/posts_repository.dart';
import 'package:sys_app/features/domain/usecases/get_all_posts.dart';

final inc = GetIt.instance;

Future<void> init() async {
  //Usecases

  inc.registerLazySingleton(() => GetAllPostsUsecase(inc()));

  //Repository

  inc.registerLazySingleton<PostsRepository>(
    () => PostsRepositoryImpl(
      remoteDataSource: inc(),
      localDataSource: inc(),
      networkInfo: inc(),
    ),
  );

  //Core

  inc.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(inc()));

  //External

  final sharedPreferences = await SharedPreferences.getInstance();
  inc.registerLazySingleton(() => sharedPreferences);
}
