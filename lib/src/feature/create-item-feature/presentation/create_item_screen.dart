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
      body: CreateItemBody(),
      bottomNavigationBar: const NFCBar(),
    );
  }
}

class CreateItemBody extends StatelessWidget {
  const CreateItemBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(234, 234, 234, 1)),
      padding: const EdgeInsets.all(20),
      child: itemInfoEnter(),
    );
  }
}

class itemInfoEnter extends StatelessWidget {
  const itemInfoEnter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: [
                  ListView(
                    children: [
                      ShelfTextField(
                        name: 'ชื่อ',
                        hintText: 'กรุณาใส่ชื่อ',
                      ),
                      ShelfTextField(
                        name: 'คำอธิบาย',
                        hintText: 'กรุณาคำอธิบาย',
                      ),
                      Row(
                        children: [
                          Flexible(
                              flex: 3,
                              child: ShelfTextField(
                                name: 'จำนวนสินค้า',
                                hintText: 'กรุณาใส่จำนวนสินค้า',
                              )),
                          Flexible(
                              flex: 1,
                              child: DropDownMenu(
                                dropDownName: 'หน่วยสินค้า',
                              )),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                              child: WeightTextField(
                                  name: 'น้ำหนัก', hintText: "", unit: "กก.")),
                          Flexible(
                              child: DropDownMenu(
                                dropDownName: 'สถานะ',
                              ))
                        ],
                      ),
                      ShelfTextField(
                        name: 'ประเภท',
                        hintText: 'กรุณาใส่ประเภทสินค้า',
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

Widget itemPictureBox = Container();

class NFCBar extends StatefulWidget {
  const NFCBar({Key? key}) : super(key: key);

  @override
  State<NFCBar> createState() => _NFCBarState();
}

class _NFCBarState extends State<NFCBar> {
  bool isNFCDone = true;

  void handleNFCUiChange() {
    setState(() {
      isNFCDone = !isNFCDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleNFCUiChange,
      child: AnimatedContainer(
        width: MediaQuery.of(context).size.width,
        height: 87,
        decoration: BoxDecoration(
            color: isNFCDone
                ? Color.fromRGBO(55, 146, 55, 1)
                : Color.fromRGBO(234, 234, 234, 1),
            border: isNFCDone
                ? null
                : Border.all(color: Color.fromRGBO(55, 146, 55, 1), width: 2),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5))),
        duration: Duration(milliseconds: 500),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.nfc_rounded,
                    color: isNFCDone
                        ? Color.fromRGBO(234, 234, 234, 1)
                        : Color.fromRGBO(55, 146, 55, 1),
                    size: 63),
                Container(
                  child: isNFCDone
                      ? Text(
                          'กรุณานำโทรศัพท์ของท่านไปวางบน\nการ์ด, แท็ก, สติกเกอร์ NFC เพื่อสแกน',
                          style: TextStyle(
                              color: Color.fromRGBO(234, 234, 234, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Sukhumvit'),
                        )
                      : NFCDoneUI,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget NFCDoneUI = (Container(
  child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
    Icon(
      Icons.check_circle,
      color: Color.fromRGBO(55, 146, 55, 1),
      size: 41,
    ),
    SizedBox(
      width: 20,
    ),
    Text(
      'สแกนเสร็จเรียบร้อย',
      style: TextStyle(
          color: Color.fromRGBO(55, 146, 55, 1),
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: 'Sukhumvit'),
    )
  ]),
));

class WeightTextField extends StatelessWidget {
  String name;
  String hintText;
  String unit;

  WeightTextField(
      {Key? key,
      required this.name,
      required this.hintText,
      required this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
                fontFamily: 'Sukhumvit',
                fontSize: 20,
                color: Color.fromRGBO(10, 36, 99, 0.9),
                fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: TextFormField(
              decoration: InputDecoration(
                  fillColor: Color.fromRGBO(234, 234, 234, 0.75),
                  filled: true,
                  suffixText: unit,
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(64, 61, 61, 0.38))),
                  hintText: hintText),
            ),
          )
        ],
      ),
    );
  }
}
