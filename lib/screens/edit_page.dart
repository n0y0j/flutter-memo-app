import 'package:flutter/material.dart';
import 'package:memo_app/models/post.dart';
import 'package:memo_app/models/post_state.dart';
import 'package:provider/provider.dart';

class EditPage extends StatefulWidget {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  var postState;

  @override
  Widget build(BuildContext context) {
    postState = Provider.of<PostState>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.save,
                color: Colors.white,
              ),
              onPressed: () {
                postState.changePostList(
                    Post(titleController.text, contentController.text));

                Navigator.pop(context, 'refresh');
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            titleInput(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.001),
            contentInput()
          ],
        ),
      ),
    );
  }

  Widget titleInput() {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(
          color: Colors.blueAccent,
          width: 1,
        ),
      ),
      child: TextField(
        controller: titleController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '제목을 입력해주세요',
        ),
      ),
    );
  }

  Widget contentInput() {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(
          color: Colors.blueAccent,
          width: 1,
        ),
      ),
      child: TextField(
        controller: contentController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '내용을 입력해주세요',
        ),
      ),
    );
  }
}
