import '../entities/post.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

// Абстрактный репозиторий для работы с постами
abstract class PostsRepository {
  // Метод для получения всех постов
  Future<Either<Failure, List<Post>>> getAllPosts();
}
