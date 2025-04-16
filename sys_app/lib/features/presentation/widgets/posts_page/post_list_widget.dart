import '../../pages/post_detail_page.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/post.dart';

// Виджет для отображения списка постов
class PostListWidget extends StatelessWidget {
  final List<Post> posts;
  const PostListWidget({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(posts[index].id.toString()),
          title: Text(
            posts[index].title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              posts[index].body,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          onTap: () {
            // Переход на страницу деталей поста при нажатии
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (_) => PostDetailPage(
                      post: posts[index],
                    ), // Передача поста в детальный виджет
              ),
            );
          },
        );
      },
      separatorBuilder:
          (context, index) => Container(
            height: 1,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(horizontal: 16),
          ),
    );
  }
}
