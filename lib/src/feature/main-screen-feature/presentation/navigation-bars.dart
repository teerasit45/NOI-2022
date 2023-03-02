import 'package:flutter/material.dart';
import 'package:noi/src/feature/create-shelf-feature/presentation/shelf-ticket-2.dart';
import 'package:noi/src/feature/create-shelf-feature/presentation/shelf-ticket-list.dart';
import 'package:noi/src/feature/create-shelf-feature/presentation/shelf-ticket.dart';
import 'package:noi/src/feature/monitoring-feature/presentation/Monitoring.dart';


class MyNavigationBars extends StatefulWidget {
  const MyNavigationBars({super.key});

  @override
  State<MyNavigationBars> createState() => _MyNavigationBarsState();
}
int selectedIndex = 0;
class _MyNavigationBarsState extends State<MyNavigationBars> {
  static List<Widget> _widgetOptions = <Widget>[
    ShelfTicketList(),
    Monitoring(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
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
          currentIndex: selectedIndex,
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