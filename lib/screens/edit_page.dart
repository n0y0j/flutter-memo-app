import 'package:flutter/material.dart';
import 'package:memo_app/models/font_state.dart';
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
  var fontState;

  @override
  Widget build(BuildContext context) {
    postState = Provider.of<PostState>(context, listen: false);
    fontState = Provider.of<FontState>(context, listen: false);

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
      bottomNavigationBar: bottomNavigationBar(),
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
          Radius.circular(10),
        ),
        border: Border.all(
          color: Colors.grey,
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
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: TextField(
        controller: contentController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '내용을 입력해주세요',
        ),
        style: TextStyle(
            fontWeight: (fontState.bold) ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      currentIndex: 0,
      onTap: (int index) {
        if (index == 0) {
          showBottomSheet();
        }
      },
      items: [
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
            Icons.text_fields,
            color: Colors.black87,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
            Icons.image,
            color: Colors.black87,
          ),
        )
      ],
    );
  }

  showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.check, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
                title: Text(
                  "글꼴 설정",
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.001),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          fontState.changeBold(!fontState.bold);
                          setState(() {});
                        },
                        child: Container(
                          color: (!fontState.bold)
                              ? Colors.white
                              : Colors.blueAccent[100],
                          child: Icon(
                            Icons.format_bold,
                            color: Colors.black,
                            size: MediaQuery.of(context).size.width * 0.13,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          });
        });
  }
}
