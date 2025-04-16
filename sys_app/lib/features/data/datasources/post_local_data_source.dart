import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sys_app/core/error/exceptions.dart';

import '../models/post_model.dart';

// Абстрактный класс для работы с локальными данными постов
abstract class PostLocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> postModels);
}

const CACHED_POSTS = "CACHED_POSTS"; // Ключ для хранения кэшированных постов

// Реализация источника локальных данных для постов
class PostLocalDataSourceImpl implements PostLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cachePosts(List<PostModel> postModels) {
    // Преобразование постов в JSON и кэширование
    List postModelsToJson =
        postModels
            .map<Map<String, dynamic>>((postModel) => postModel.toJson())
            .toList();
    sharedPreferences.setString(CACHED_POSTS, json.encode(postModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    // Получение кэшированных постов из SharedPreferences
    final jsonString = sharedPreferences.getString(CACHED_POSTS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<PostModel> jsonToPostModels =
          decodeJsonData
              .map<PostModel>(
                (jsonPostModel) => PostModel.fromJson(jsonPostModel),
              )
              .toList();
      return Future.value(jsonToPostModels);
    } else {
      throw EmptyCacheException();
    }
  }
}
