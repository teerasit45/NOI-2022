import 'package:flutter/material.dart';

class MainScreenColumn extends StatefulWidget {
  const MainScreenColumn({Key? key}) : super(key: key);

  @override
  State<MainScreenColumn> createState() => _MainScreenColumnState();
}

class _MainScreenColumnState extends State<MainScreenColumn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("MainScreen",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),)],
        ),
      ),
    );
  }
}