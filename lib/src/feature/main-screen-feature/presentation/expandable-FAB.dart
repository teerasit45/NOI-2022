import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddExpandleFAB extends StatefulWidget {
  const AddExpandleFAB({Key? key}) : super(key: key);

  @override
  State<AddExpandleFAB> createState() => _AddExpandleFABState();
}

bool isOpen = true;

class _AddExpandleFABState extends State<AddExpandleFAB> {
  //Use this for determined close or open

  void pressAddBtn() {
    //Handle Add Btn Behavior
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FABSubMenu(
            menuName: "สร้างสินค้า",
            menuIcon: Icons.add_shopping_cart,
            menuIconColor: Color.fromRGBO(55, 146, 55, 1)
        ),
        FABSubMenu(
          menuName: "สร้างชั้นวางของ",
          menuIcon: Icons.shelves,
          menuIconColor: Color.fromRGBO(10, 36, 99, 1),
        ),
        SizedBox(
          width: 64,
          height: 64,
          child: FittedBox(
            child: Column(
              children: [
                FloatingActionButton(
                  backgroundColor: Color.fromRGBO(211, 47, 47, 1),
                  onPressed: pressAddBtn,
                  child: Center(
                      child: Container(
                          child: Icon(
                    isOpen ? Icons.close_rounded : Icons.add,
                    size: 45,
                    color: Color.fromRGBO(217, 217, 217, 1),
                  ))),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FABSubMenu extends StatefulWidget {
  String menuName;
  IconData menuIcon;
  Color menuIconColor;

  FABSubMenu(
      {Key? key,
      required this.menuName,
      required this.menuIcon,
      required this.menuIconColor})
      : super(key: key);

  @override
  State<FABSubMenu> createState() => _FABSubMenuState();
}

class _FABSubMenuState extends State<FABSubMenu> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isOpen,
      child: GestureDetector(
        onTap: () => print("${widget.menuName}: Tapped"),
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text(widget.menuName,
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Sukhumvit',
                    fontWeight: FontWeight.w600)),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: widget.menuIconColor,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              width: 30,
              height: 30,
              child: Center(
                child: Icon(
                  widget.menuIcon as IconData?,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            )
          ]),
        ),
      ),
    );
  }
}
