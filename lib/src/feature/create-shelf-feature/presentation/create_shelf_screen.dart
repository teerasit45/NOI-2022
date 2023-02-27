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
              child: Text('บันทึก',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(234, 234, 234, 1),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Sukhumvit')))
        ],
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: Text("สร้างชั้นวางของ",
            style: TextStyle(
                color: Color.fromRGBO(234, 234, 234, 1),
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Sukhumvit')),
      ),
      body: CreateShelfBody(),
    );
  }
}

class CreateShelfBody extends StatelessWidget {
  const CreateShelfBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(234, 234, 234, 1)),
      padding: const EdgeInsets.all(20),
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
          padding: EdgeInsets.all(10),
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
                  name: 'จำนวนสินค้า',
                  hintText: 'สินค้า',
                )),
              ],
            ),
            Row(
              children: [
                Flexible(
                    flex: 1,
                    child: ShelfTextField(
                      name: 'หมายเลข',
                      hintText: 'กรุณาใส่หมายเลข',
                    )),
                Flexible(
                    flex: 1,
                    child: statusDropDown(
                      name: 'สถานะ',
                    )),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

//============================Below here is widgets===============================//

Widget shefInfoLabel = Text(
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
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
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

class statusDropDown extends StatefulWidget {
  String name;

  statusDropDown({Key? key, required this.name}) : super(key: key);

  @override
  State<statusDropDown> createState() => _statusDropDownState();
}

class _statusDropDownState extends State<statusDropDown> {
  String dropDownVaule = "";

  void dropdownCallback(String? selectedVaule) {
    if (selectedVaule is String) {
      setState(() {
        dropDownVaule = selectedVaule;
      });
    }
  }

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
            widget.name,
            style: TextStyle(
                fontFamily: 'Sukhumvit',
                fontSize: 20,
                color: Color.fromRGBO(10, 36, 99, 0.9),
                fontWeight: FontWeight.w600),
          ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
          //   child: DropdownButton(
          //     items: const [
          //       DropdownMenuItem(
          //         child: Text("จัดเก็บ"),
          //         value: "Done",
          //       ),
          //       DropdownMenuItem(
          //         child: Text("กำลังจัดเก็บ"),
          //         value: "Doing",
          //       ),
          //       DropdownMenuItem(
          //         child: Text("ยังไม่จัดเก็บ"),
          //         value: "Undone",
          //       ),
          //     ],
          //     onChanged: dropdownCallback,
          //     value: dropDownVaule,
          //   ),
          // )
        ],
      ),
    );
  }
}
