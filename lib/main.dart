import 'package:flutter/material.dart';
import 'package:memo_app/models/font_state.dart';
import 'package:memo_app/models/post_state.dart';
import 'package:memo_app/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PostState>(create: (context) => PostState()),
        ChangeNotifierProvider<FontState>(create: (context) => FontState())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: HomePage(),
      ),
    );
  }
}
