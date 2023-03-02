import 'package:flutter/material.dart';

var mainBlue = const Color.fromRGBO(10, 36, 99, 1);
var mainWhite = const Color.fromRGBO(234, 234, 234, 1);
var questionLabelTextStyle = const TextStyle(
    color: Color.fromRGBO(10, 36, 99, 0.9),
    fontWeight: FontWeight.w600,
    fontSize: 20,
    fontFamily: 'Sukhumvit');
var infoBoxLabelTextStyle = const TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontWeight: FontWeight.w600,
    fontSize: 24,
    fontFamily: 'Sukhumvit');
var appBarTextStyle = TextStyle(
    color: mainWhite,
    fontWeight: FontWeight.w600,
    fontSize: 20,
    fontFamily: 'Sukhumvit');

var nameTextController = TextEditingController();
var detailTextController = TextEditingController();
var shelfTextController = TextEditingController();
var itemPerShelfTextController = TextEditingController();
var shelfIdTextController = TextEditingController();
var shelfTypeTextController = TextEditingController();

const List<String> statusList = <String>[
  ' ',
  'จัดเก็บ',
  'กำลังจัดเก็บ',
  'ยังไม่จัดเก็บ'
];

// ===================================== Color and TextStyle Above =============

class CreatingShelvesBody extends StatefulWidget {
  const CreatingShelvesBody({Key? key}) : super(key: key);

  @override
  State<CreatingShelvesBody> createState() => _CreatingShelvesBodyState();
}

class _CreatingShelvesBodyState extends State<CreatingShelvesBody> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: shelvesAppBar(),
      ),
      body: ShelfInfoBody(),
      bottomNavigationBar: NFCBar(),
    );
  }
}
/*
* ==============================Below are infolist ==================*/
List<String> shelfNameList = [];
List<String> shelfDetailList = [];
List<String> shelfIdList = [];
List<String> shelfQuantityList = [];
List<String> itemPerShelfList = [];
List<String> shelfTypeList =[];


/*
*  ======================================== Widget Below Here =====================*/

class shelvesAppBar extends StatefulWidget {
  const shelvesAppBar({Key? key}) : super(key: key);

  @override
  State<shelvesAppBar> createState() => _shelvesAppBarState();
}

class _shelvesAppBarState extends State<shelvesAppBar> {

  void handleSaveBtn() {
    print('Savedd');
    Navigator.of(context).pop();
    setState(() {
      shelfNameList.add(nameTextController.text);
      shelfDetailList.add(detailTextController.text);
      shelfIdList.add(shelfIdTextController.text);
      shelfQuantityList.add(shelfTextController.text);
      itemPerShelfList.add(itemPerShelfTextController.text);
      shelfTypeList.add(shelfTypeTextController.text);

    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: mainBlue,
      title: Text('สร้างชั้นวางของ', style: appBarTextStyle),
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_rounded),
          color: mainWhite,
          iconSize: 22),
      actions: [
        TextButton(
            onPressed: () => handleSaveBtn(),
            child: Text(
              'บันทึก',
              style: appBarTextStyle,
            ))
      ],
    );
  }
}

class ShelfInfoBody extends StatelessWidget {
  const ShelfInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: mainWhite),
      child: const ShelfInfoBox(),
    ));
  }
}

class ShelfInfoBox extends StatelessWidget {
  const ShelfInfoBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          'ข้อมูลชั้นวางของ',
                          style: infoBoxLabelTextStyle,
                        )),
                    InfoBox(
                      questionName: 'ชื่อ',
                      subfix: '',
                      hintText: 'กรุณาใส่ชื่อ',
                      infoBoxController: nameTextController,
                    ),
                    InfoBox(
                        questionName: 'คำอธิบาย',
                        subfix: '',
                        hintText: 'กรุณาใส่คำอธิบาย',
                        infoBoxController: detailTextController),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: InfoBox(
                              subfix: 'ชิ้น',
                              questionName: 'จำนวนชั้น',
                              hintText: 'จำนวนชั้น',
                              infoBoxController: shelfTextController),
                        ),
                        Flexible(
                          child: InfoBox(
                              subfix: 'ชิ้น',
                              questionName: 'สินค้าต่อชั้น',
                              hintText: 'จำนวนสินค้า',
                              infoBoxController: itemPerShelfTextController),
                        ),
                      ],
                    ),
                    InfoBox(
                        questionName: 'ประเภท',
                        hintText: 'กรุณาใส่ประเภท',
                        infoBoxController: shelfTypeTextController,
                        subfix: ''),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: InfoBox(
                              questionName: 'หมายเลข',
                              hintText: 'กรุณาใส่หมายเลข',
                              infoBoxController: shelfIdTextController,
                              subfix: ''),
                        ),
                        Flexible(
                          flex: 1,
                          child: DropDownMenu(
                              dropDownName: 'สถานะ',
                              dropMenuChoice: statusList),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ));
  }
}

class InfoBox extends StatefulWidget {
  String questionName, hintText, subfix;
  TextEditingController infoBoxController;

  InfoBox(
      {Key? key,
      required this.questionName,
      required this.hintText,
      required this.infoBoxController,
      required this.subfix})
      : super(key: key);

  @override
  State<InfoBox> createState() => _InfoBoxState();
}

class _InfoBoxState extends State<InfoBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.questionName,
            style: questionLabelTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: TextFormField(
              controller: widget.infoBoxController,
              decoration: InputDecoration(
                  suffixText: widget.subfix,
                  fillColor: const Color.fromRGBO(234, 234, 234, 0.75),
                  filled: true,
                  border: const OutlineInputBorder(),
                  enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(64, 61, 61, 0.38))),
                  hintText: widget.hintText),
            ),
          )
        ],
      ),
    );
  }
}

class DropDownMenu extends StatelessWidget {
  String dropDownName;
  List<String> dropMenuChoice;

  DropDownMenu(
      {Key? key, required this.dropDownName, required this.dropMenuChoice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dropDownName,
            style: const TextStyle(
                fontFamily: 'Sukhumvit',
                fontSize: 20,
                color: Color.fromRGBO(10, 36, 99, 0.9),
                fontWeight: FontWeight.w600),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 0, 10),
              child: DropDownBox(
                dropDownChoice: dropMenuChoice,
              ))
        ],
      ),
    );
  }
}

class DropDownBox extends StatefulWidget {
  List<String> dropDownChoice;

  DropDownBox({super.key, required this.dropDownChoice});

  @override
  State<DropDownBox> createState() => _DropDownBoxState();
}

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
                ? const Color.fromRGBO(10, 36, 99, 1)
                : const Color.fromRGBO(234, 234, 234, 1),
            border: isNFCDone
                ? null
                : Border.all(
                    color: const Color.fromRGBO(10, 36, 99, 1), width: 2),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5))),
        duration: const Duration(milliseconds: 1000),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.nfc_rounded,
                    color: isNFCDone
                        ? const Color.fromRGBO(234, 234, 234, 1)
                        : const Color.fromRGBO(10, 36, 99, 1),
                    size: 63),
                Container(
                  child: isNFCDone
                      ? const Text(
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
  child: Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
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
