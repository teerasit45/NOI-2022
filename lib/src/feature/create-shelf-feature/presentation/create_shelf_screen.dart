import 'package:flutter/material.dart';

class CreateShelf extends StatelessWidget {
  const CreateShelf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(10, 36, 99, 1),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text('บันทึก',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(234, 234, 234, 1),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Sukhumvit')))
        ],
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: const Text("สร้างชั้นวางของ",
            style: TextStyle(
                color: Color.fromRGBO(234, 234, 234, 1),
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Sukhumvit')),
      ),
      body: const CreateShelfBody(),
      bottomNavigationBar: const NFCBar(),
    );
  }
}

class CreateShelfBody extends StatelessWidget {
  const CreateShelfBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration:  BoxDecoration(color: Color.fromRGBO(234, 234, 234, 1)),
      padding:  EdgeInsets.all(20),
      child: ShelfInfoEnter(),
    );
  }
}

class ShelfInfoEnter extends StatelessWidget {
  const ShelfInfoEnter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(9),
          child: Column(children: [
            Container(
                child: Row(
              children: [shefInfoLabel],
            )),
            ShelfTextField(
              name: 'ชื่อ',
              hintText: 'กรุณาใส่ชื่อ',
            ),
            ShelfTextField(
              name: 'คำฮธิบาย',
              hintText: 'กรุณาใส่คำอธิบาย',
            ),
            Row(
              children: [
                Flexible(
                    child: ShelfTextField(
                  name: 'จำนวนชั้น',
                  hintText: 'ชั้น',
                )),
                Flexible(
                    child: ShelfTextField(
                  name: 'จำนวนสินค้าต่อชั้น',
                  hintText: 'สินค้า',
                )),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    flex: 1,
                    child: ShelfTextField(
                      name: 'หมายเลข',
                      hintText: 'กรุณาใส่หมายเลข',
                    )),
                 Flexible(flex: 1, child: DropDownMenu(dropDownName: 'สถานะ',)),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

//============================Below here is widgets===============================//

Widget shefInfoLabel = const Text(
  "ข้อมูลชั้นวางของ",
  style: TextStyle(
      color: Colors.black,
      fontFamily: 'Sukhumvit',
      fontWeight: FontWeight.w600,
      fontSize: 24),
);

class ShelfTextField extends StatelessWidget {
  String name;
  String hintText;

  ShelfTextField({Key? key, required this.name, required this.hintText})
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

class DropDownMenu extends StatelessWidget {
  String dropDownName;
   DropDownMenu({Key? key, required this.dropDownName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(
            dropDownName,
            style: TextStyle(
                fontFamily: 'Sukhumvit',
                fontSize: 20,
                color: Color.fromRGBO(10, 36, 99, 0.9),
                fontWeight: FontWeight.w600),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 0, 10),
              child: DropDownBox())
        ],
      ),
    );
  }
}

class DropDownBox extends StatefulWidget {
  const DropDownBox({super.key});

  @override
  State<DropDownBox> createState() => _DropDownBoxState();
}

const List<String> statusList = <String>[
  ' ',
  'จัดเก็บ',
  'กำลังจัดเก็บ',
  'ยังไม่าจัดเก็บ'
];

class _DropDownBoxState extends State<DropDownBox> {
  String dropdownValue = statusList.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down_outlined),
      elevation: 20,
      style: const TextStyle(color: Colors.black, fontSize: 18),
      underline: Container(
        height: 2,
        color: const Color.fromRGBO(10, 36, 99, 0.9),
      ),
      dropdownColor: const Color.fromRGBO(234, 234, 234, 0.75),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: statusList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

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
                ? Color.fromRGBO(10, 36, 99, 1)
                : Color.fromRGBO(234, 234, 234, 1),
            border: isNFCDone
                ? null
                : Border.all(color: Color.fromRGBO(10, 36, 99, 1), width: 2),
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
                        : Color.fromRGBO(10, 36, 99, 1),
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
      color: Color.fromRGBO(10, 36, 99, 1),
      size: 41,
    ),
    SizedBox(
      width: 20,
    ),
    Text(
      'สแกนเสร็จเรียบร้อย',
      style: TextStyle(
          color: Color.fromRGBO(10, 36, 99, 1),
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: 'Sukhumvit'),
    )
  ]),
));