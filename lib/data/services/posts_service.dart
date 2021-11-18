import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class PostService {
  static const FETCH_LIMIT = 15;
  final baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<dynamic>> fetchPosts(int page) async {
    try {
      final response = await http
          .get(Uri.parse("$baseUrl/posts?_limit=$FETCH_LIMIT&_page=$page"));
      Logger().w('fetchPosts : ${jsonDecode(response.body) as List}');
      return jsonDecode(response.body) as List<dynamic>;
    } catch (err) {
      Logger().e('onError : $err');
      return [];
    }
  }
}
