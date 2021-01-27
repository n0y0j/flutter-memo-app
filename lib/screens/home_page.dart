import 'package:flutter/material.dart';
import 'package:memo_app/models/post.dart';
import 'package:memo_app/models/post_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var postState;

  @override
  void initState() {
    super.initState();
    postState = Provider.of<PostState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Memo"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: postState.postList.length,
        itemBuilder: (BuildContext _context, int index) {
          return buildPost(postState.postList[index]);
        },
      ),
    );
  }

  Widget buildPost(Post post) {
    return ListTile(
      title: Text(post.title),
      subtitle: Text(post.content),
    );
  }
}
