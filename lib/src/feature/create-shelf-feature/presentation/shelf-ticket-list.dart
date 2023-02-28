import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noi/src/feature/create-shelf-feature/presentation/shelf-ticket.dart';

class ShelfList extends StatefulWidget {
  const ShelfList({Key? key}) : super(key: key);

  @override
  State<ShelfList> createState() => _ShelfListState();
}

class _ShelfListState extends State<ShelfList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          height: 85,
          width: 360,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.5),
                blurRadius: 5,
                offset: Offset(0, 4))
          ]),
          child: Padding(
            padding: EdgeInsets.all(2),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'เลขที่',
                      style: TextStyle(
                        color: Color.fromRGBO(10, 36, 99, 1),
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      '001',
                      style: TextStyle(
                        color: Color.fromRGBO(10, 36, 99, 1),
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: Center(
                    child: Container(
                      height: 61,
                      width: 2,
                      decoration: BoxDecoration(color: Color.fromRGBO(28, 27, 31, 0.76),borderRadius: BorderRadius.circular(3)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 3,top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ชื่อ: หนังสือภาษาไทย',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                      Text('สถานะ: จัดเก็บ  ประเภท: แหล่งความรู้',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                      Row(
                        children: [
                          Container(width: 180,),
                          Text('6/1/2566 - 8:22',style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.76),fontSize: 14,fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
