part of 'posts_bloc.dart';

// Базовый класс для событий постов
sealed class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

// Событие для получения всех постов
class GetAllPostsEvent extends PostsEvent {}

// Событие для обновления постов
class RefreshPostsEvent extends PostsEvent {}
