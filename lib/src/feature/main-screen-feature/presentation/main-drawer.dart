import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './drawer-setting.dart';

Widget mainDrawer = Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      SizedBox(
        height: 215,
        child: DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff0a2463),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 40,
                    ),
                    Text(
                      "สถานะ",
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15)))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("ชื่อ : " + "Hello",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    Text("ID : " + "1212312121",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    Text("ตำแหน่ง : " + "นักศึกษา",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                  ],
                ),
              ],
            )),
      ),
      Builder(
        builder: (context) {
          return ListTile(
            leading: Icon(Icons.settings),
            title: Text("การตั้งค่า",
                style: TextStyle(
                  fontSize: 15,
            )),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Setting()),
              );
            },
          );
        }
      ),
    ],
  ),
);
