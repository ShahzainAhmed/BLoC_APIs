// ignore_for_file: avoid_print

import 'package:bloc_apis/features/posts/models/posts_data_ui_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

class PostsRepo {
// if not making it static, then you will have to create its instance to use it,
// but we are using here static, so no need to make an instance

  static Future<List<PostsDataUiModel>> fetchPosts() async {
    var client = Client();
    try {
      List<PostsDataUiModel> posts = [];
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        // for every response map, i am going to convert that map into a dart model then
        // i am going to append this posts list
        PostsDataUiModel post = PostsDataUiModel.fromJson(result[i]);
        posts.add(post);
      }
      return posts;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  // will just return a bool
  static Future<bool> addPosts() async {
    var client = Client();
    try {
      var response = await client
          .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'), body: {
        'title': 'Shahzain Ahmed is a Flutter Developer',
        'body': 'He has good knowledge of Android and iOS',
        'userId': "86",
      });

      if (response.statusCode == 200) {
        print(response.statusCode);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
