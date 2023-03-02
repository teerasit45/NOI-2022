import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:noi/src/feature/main-screen-feature/presentation/expandable-FAB.dart';

import './appbar-widgets.dart';
import './main-screen-body.dart';
import './main-drawer.dart';
import './navigation-bars.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color(0xffeaeaea),
      drawer: mainDrawer,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180.0), // here the desired height
        child: mainAppbar,),
      // body:  Center(
      //   child: MainScreenColumn(),
      // ),
      body: MyNavigationBars(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: AddExpandleFAB(),
      ),

    );
  }
}
