import 'package:flutter/material.dart';
import 'package:noi/src/feature/main-screen-feature/presentation/main_screen.dart';
import './appbar-widgets.dart';
import './main-screen-body.dart';
import './main-drawer.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Sukhumvit",
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color(0xff0a2463),
          title: Text("การตั้งค่า"),
        ),
      )
    );
  }
}