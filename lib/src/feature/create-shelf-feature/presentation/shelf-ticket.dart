import 'package:flutter/material.dart';
import 'package:noi/src/feature/create-shelf-feature/presentation/shelf-ticket-list.dart';

class ShelfTicket extends StatefulWidget {
  const ShelfTicket({Key? key}) : super(key: key);

  @override
  State<ShelfTicket> createState() => _ShelfTicketState();
}
bool isDark = true;
class _ShelfTicketState extends State<ShelfTicket> {


  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color.fromRGBO(234, 234, 234, 1)),
        child: Stack(children: [
          ListView(
            padding: EdgeInsets.all(10),
            children: [
              ShelfList(shelfName: '', shelfStatus: '', shelfType: '', shelfInt: '',),
            ],
          ),
        ]));
  }

  Widget darkScreen = Visibility(
    visible: isDark ,
    child: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
    ),
  );

}

