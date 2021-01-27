import 'package:flutter/material.dart';
import 'package:memo_app/models/post.dart';

class PostState with ChangeNotifier {
  List<Post> postList = [];

  changePostList(Post post) {
    postList.add(post);
    notifyListeners();
  }
}
