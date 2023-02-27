import 'package:flutter/material.dart';


class MyNavigationBars extends StatefulWidget {
  const MyNavigationBars({super.key});

  @override
  State<MyNavigationBars> createState() => _MyNavigationBarsState();
}

class _MyNavigationBarsState extends State<MyNavigationBars> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 1'),
    Text('Index 2'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'ชั้นวางของ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_graph),
              label: 'สรุปข้อมูล',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xff0a2463),
          onTap: _onItemTapped,
      ),
    );
  }
}

// BottomNavigationBarItem MyNavigationItem(Icon icon,String label) {
//   return BottomNavigationBarItem(
//       icon: icon,
//       label: label,
//       backgroundColor: Color(0xff0a2463),
//       );
// }