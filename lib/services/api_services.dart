import 'dart:convert';

import 'package:assignment/model/comment.dart';
import 'package:assignment/model/post.dart';
import 'package:assignment/utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
 Future<List<PostModel>> fetchPosts(int start, int limit) async {
  final response = await http.get(Uri.parse('${AppConstants.postsEndpoint}?_start=$start&_limit=$limit'));
  if (response.statusCode == 200) {
    // Convert the response body into a List of PostModel
    final List jsonData = json.decode(response.body);
    return jsonData.map((json) => PostModel.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load posts');
  }
}

  Future<List<CommentModel>> fetchComments(int postId) async {
    final response = await http.get(Uri.parse('${AppConstants.commentsEndpoint}?postId=$postId'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      print(jsonData);
    return jsonData.map((json) => CommentModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }
}
