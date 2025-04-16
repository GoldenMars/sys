import '../../domain/entities/post.dart';

// Модель данных поста, наследующаяся от сущности Post
class PostModel extends Post {
  const PostModel({int? id, required String title, required String body})
    : super(id: id, title: title, body: body);

  // Фабричный метод для создания экземпляра PostModel из JSON
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(id: json['id'], title: json['title'], body: json['body']);
  }

  // Метод для преобразования PostModel в JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': body};
  }
}
