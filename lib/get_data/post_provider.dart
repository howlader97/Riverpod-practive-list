import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learn_list/get_data/post_model.dart';
import 'package:http/http.dart' as http;

final postProvider = FutureProvider<List<PostModel>>((ref) async {
  try {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      headers: {"Content-type":"application/json"}
    );
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      List<PostModel> postList = data
          .map((e) => PostModel.fromJson(e))
          .toList();
      return postList;
    } else {
      throw "something went wrong";
    }
  } catch (e) {
    rethrow;
  }
});
