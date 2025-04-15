import 'package:get_it/get_it.dart';
import 'package:sys_app/features/domain/usecases/get_all_posts.dart';

final inc = GetIt.instance;

Future<void> init() async {
  //Usecases

  inc.registerLazySingleton(() => GetAllPostsUsecase(inc()));
}
