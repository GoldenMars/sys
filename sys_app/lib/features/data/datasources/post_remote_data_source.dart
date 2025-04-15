import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sys_app/core/error/exceptions.dart';
import 'package:sys_app/features/data/models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
}

const BASE_URL = 'https://jsonplaceholder.typicode.com';

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final dio = Dio();

  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await dio.get(BASE_URL + '/posts/');

    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.data) as List;
      final List<PostModel> postModels =
          decodedJson
              .map<PostModel>(
                (jsonPostModel) => PostModel.fromJson(jsonPostModel),
              )
              .toList();

      return postModels;
    } else {
      throw ServerException();
    }
  }
}
