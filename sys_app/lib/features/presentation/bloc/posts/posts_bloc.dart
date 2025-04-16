import 'package:bloc/bloc.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/strings/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/post.dart';
import '../../../domain/usecases/get_all_posts.dart';

part 'posts_event.dart';
part 'posts_state.dart';

// BLoC для управления состоянием постов
class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUsecase
  getAllPosts; // Используемый класс для получения постов

  PostsBloc({required this.getAllPosts}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      if (event is GetAllPostsEvent) {
        emit(LoadingPostsState()); // Установка состояния загрузки

        final failureOrPosts = await getAllPosts(); // Получение постов
        emit(_mapFailureOrPostsToState(failureOrPosts)); // Обработка результата
      } else if (event is RefreshPostsEvent) {
        emit(LoadingPostsState()); // Установка состояния загрузки

        final failureOrPosts = await getAllPosts();
        emit(_mapFailureOrPostsToState(failureOrPosts));
      }
    });
  }

  // Обработка результата получения постов или ошибок
  PostsState _mapFailureOrPostsToState(Either<Failure, List<Post>> either) {
    return either.fold(
      (failure) =>
          ErrorPostsState(message: _mapFailureToMessage(failure)), // Ошибка
      (posts) => LoadedPostsState(posts: posts), // Успешное получение постов
    );
  }

  // Преобразование ошибок в сообщения
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
