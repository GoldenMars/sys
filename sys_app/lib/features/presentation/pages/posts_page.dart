import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sys_app/core/widgets/loading_widget.dart';
import 'package:sys_app/features/presentation/widgets/posts_page/message_display_widget.dart';
import 'package:sys_app/features/presentation/widgets/posts_page/post_list_widget.dart';

import '../bloc/posts/posts_bloc.dart';

// Страница для отображения списка постов
class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppbar(), body: _buildBody());
  }

  AppBar _buildAppbar() => AppBar(title: Text('Posts'));

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          // Обработка состояний BLoC
          if (state is LoadingPostsState) {
            return LoadingWidget(); // Индикатор загрузки
          } else if (state is LoadedPostsState) {
            return RefreshIndicator(
              onRefresh: () => _onRefresh(context), // Обновление списка постов
              child: PostListWidget(posts: state.posts),
            );
          } else if (state is ErrorPostsState) {
            return MessageDisplayWidget(
              message: state.message,
            ); // Сообщение об ошибке
          }
          return LoadingWidget(); // По умолчанию индикатор загрузки
        },
      ),
    );
  }

  // Метод для обработки обновления списка постов
  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<PostsBloc>(context).add(RefreshPostsEvent());
  }
}
