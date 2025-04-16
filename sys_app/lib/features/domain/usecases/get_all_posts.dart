import '../repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/post.dart';

// Используемый класс для получения всех постов
class GetAllPostsUsecase {
  final PostsRepository repository;

  GetAllPostsUsecase(this.repository);

  // Метод для выполнения запроса на получение всех постов
  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getAllPosts();
  }
}
