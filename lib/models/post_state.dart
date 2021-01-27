import 'package:flutter/material.dart';
import 'package:memo_app/models/post.dart';

class PostState with ChangeNotifier {
  List<Post> postList = [];

  changePostList(Post val) {
    postList.add(val);
    notifyListeners();
  }
}
