import 'package:flutter/material.dart';
import 'package:noi/src/feature/create-shelf-feature/presentation/create_shelf_screen.dart';
import 'package:noi/src/feature/main-screen-feature/presentation/expandable-FAB.dart';

class createItem extends StatelessWidget {
  const createItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(55, 146, 55, 1),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text('บันทึก',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(234, 234, 234, 1),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Sukhumvit')))
        ],
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: const Text("สร้างสินค้า",
            style: TextStyle(
                color: Color.fromRGBO(234, 234, 234, 1),
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Sukhumvit')),
      ),
      body: Text("Empty"),
      bottomNavigationBar: const NFCBar(),
    );
  }
}
