import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noi/src/feature/create-shelf-feature/presentation/create-shelf-screen-2.dart';
import 'package:noi/src/feature/create-shelf-feature/presentation/create_shelf_screen.dart';

var mainBackgroundColor = const Color.fromRGBO(234, 234, 234, 1);
var idTextStyle = const TextStyle(
    color: Color.fromRGBO(10, 36, 99, 1),
    fontFamily: 'Sukhumvit',
    fontSize: 24,
    fontWeight: FontWeight.w700);

var deteilTextStyle = const TextStyle(
    color: Colors.black,
    fontFamily: 'Sukhumvit',
    fontSize: 16,
    fontWeight: FontWeight.w600);
var timeStamp = const TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.76),
    fontFamily: 'Sukhumvit',
    fontWeight: FontWeight.w500,
    fontSize: 12);

var line = Container(
  height: 61,
  width: 2,
  decoration: BoxDecoration(
      color: Color.fromRGBO(28, 27, 31, 0.76),
      borderRadius: BorderRadius.circular(3)),
);
var ticketDecolation = const BoxDecoration(color: Colors.white, boxShadow: [
  BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.5), blurRadius: 5, offset: Offset(0, 4))
]);


class ShelfTicketList extends StatefulWidget {
  const ShelfTicketList({Key? key}) : super(key: key);

  @override
  State<ShelfTicketList> createState() => _ShelfTicketListState();
}

class _ShelfTicketListState extends State<ShelfTicketList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height,
      decoration: BoxDecoration(color: mainBackgroundColor),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ShelfTicketTemplate(
                        shelfName: "หนังสือภาษาไทย",
                        shelfID: "001",
                        shelfType: "แหล่งความรู้",
                        shelfStatus: "จัดเก็บ"),
                    ShelfTicketTemplate(
                        shelfName: "หนังสือภาษาอังกฤษ",
                        shelfID: "002",
                        shelfType: "แหล่งความรู้",
                        shelfStatus: "กำลังจัดเก็บ"),
                    ShelfTicketTemplate(
                        shelfName: "หนังสือภาษาสังคม",
                        shelfID: "003",
                        shelfType: "แหล่งความรู้",
                        shelfStatus: "ยังไม่จัดเก็บ"),
                    ShelfTicketTemplate(
                        shelfName: "หนังสือวิทยาศาสตร์",
                        shelfID: "004",
                        shelfType: "แหล่งความรู้",
                        shelfStatus: "จัดเก็บ"),
                    ShelfTicketTemplate(
                        shelfName: "คอมพิวเตอร์",
                        shelfID: "005",
                        shelfType: "แหล่งความรู้",
                        shelfStatus: "กำลังจัดเก็บ"),
                    NewTicket(shelfName: 'Ipad',
                        shelfID: "012",
                        shelfType: "แหล่งความรู้",
                        shelfStatus: "กำลังจัดเก็บ"),
                    ListView.builder(
                        itemCount: number.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return NewTicket(shelfName: name[index],
                              shelfID: number[index],
                              shelfType: type[index],
                              shelfStatus: status[index]);
                        }
                    ),
                    SizedBox(height: 50,),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class NewTicket extends StatefulWidget {
  String shelfID, shelfName, shelfStatus, shelfType;

  NewTicket({Key? key, required this.shelfName,
    required this.shelfID,
    required this.shelfType,
    required this.shelfStatus}) : super(key: key);

  @override
  State<NewTicket> createState() => _NewTicketState();
}

class _NewTicketState extends State<NewTicket> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ชื่อ: ${widget.shelfName}',
              style: deteilTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'สถานะ: ${widget.shelfStatus}',
                  style: deteilTextStyle,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'ประเภท: ${widget.shelfType}',
                  style: deteilTextStyle,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 160,
                ),
                Text(
                  '6/1/2566 - 8:22',
                  style: timeStamp,
                )
              ],
            )
          ],
        ),
        leading: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.shelfID,
                  style: idTextStyle,
                )
              ],
            )),
      ),
    );
  }
}


class ShelfTicketTemplate extends StatefulWidget {
  String shelfID, shelfName, shelfStatus, shelfType;

  ShelfTicketTemplate({Key? key,
    required this.shelfName,
    required this.shelfID,
    required this.shelfType,
    required this.shelfStatus})
      : super(key: key);

  @override
  State<ShelfTicketTemplate> createState() => _ShelfTicketTemplateState();
}

class _ShelfTicketTemplateState extends State<ShelfTicketTemplate> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Container(
              height: 85,
              width: 360,
              decoration: ticketDecolation,
              child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('เลขที่', style: idTextStyle),
                          Text(
                            widget.shelfID,
                            style: idTextStyle,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Center(child: line),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3, top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ชื่อ: ${widget.shelfName}',
                              style: deteilTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'สถานะ: ${widget.shelfStatus}',
                                  style: deteilTextStyle,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'ประเภท: ${widget.shelfType}',
                                  style: deteilTextStyle,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 185,
                                ),
                                Text(
                                  '6/1/2566 - 8:22',
                                  style: timeStamp,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            )));
  }
}
