import 'package:dartz/dartz.dart';
import 'package:sys_app/core/error/exceptions.dart';
import 'package:sys_app/core/error/failures.dart';
import 'package:sys_app/core/network/network_info.dart';
import 'package:sys_app/features/data/datasources/post_local_data_source.dart';
import 'package:sys_app/features/data/datasources/post_remote_data_source.dart';
import 'package:sys_app/features/domain/entities/post.dart';
import 'package:sys_app/features/domain/repositories/posts_repository.dart';

// Реализация репозитория для работы с постами
class PostsRepositoryImpl implements PostsRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    // Проверка наличия интернет-соединения
    if (await networkInfo.isConnected) {
      try {
        // Получение постов из удаленного источника
        final remotePosts = await remoteDataSource.getAllPosts();
        // Кэширование полученных постов
        localDataSource.cachePosts(remotePosts);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        // Получение кэшированных постов
        final localPosts = await localDataSource.getCachedPosts();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
