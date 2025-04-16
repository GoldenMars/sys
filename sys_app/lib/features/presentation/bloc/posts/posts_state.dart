part of 'posts_bloc.dart';

// Базовый класс для состояний постов
abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

// Начальное состояние постов
class PostsInitial extends PostsState {}

// Состояние загрузки постов
class LoadingPostsState extends PostsState {}

// Состояние, когда посты успешно загружены
class LoadedPostsState extends PostsState {
  final List<Post> posts;

  LoadedPostsState({required this.posts});

  @override
  List<Object> get props => [posts];
}

// Состояние ошибки при загрузке постов
class ErrorPostsState extends PostsState {
  final String message;

  ErrorPostsState({required this.message});

  @override
  List<Object> get props => [message];
}
