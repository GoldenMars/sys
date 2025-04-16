import 'package:flutter/material.dart';

import '../../../domain/entities/post.dart';

// Виджет для отображения деталей поста
class PostDetailWidget extends StatelessWidget {
  final Post post;
  const PostDetailWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          // Заголовок поста
          Text(
            post.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Divider(height: 50),
          // Содержимое поста
          Text(post.body, style: TextStyle(fontSize: 16)),
          Divider(height: 50),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              
            ],
          ),
        ],
      ),
    );
  }
}
