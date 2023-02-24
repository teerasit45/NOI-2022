import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget mainAppbar = AppBar(
  bottom: PreferredSize(
    preferredSize: Size.fromHeight(70.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: null,
                icon: Icon(Icons.account_circle,
                  color: Colors.white,
                  size: 30,
                )),
            Text("ชั้นวางของ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: "Sukhumvit"
              ),),
            IconButton(
                onPressed: null,
                icon: Icon(Icons.notifications,
                    color: Colors.white,
                    size: 30
                ))
          ],
        ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 56,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: null,
                      icon: Icon(Icons.menu),
                  ),
                  Text("ค้นหา"),
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.search),
                  ),
                ],
              )),
          ],
        ),
    ),
  );

class searchBar extends StatefulWidget {
  const searchBar({Key? key}) : super(key: key);

  @override
  State<searchBar> createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 56,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(40))),
      child: Row(
        children: [
          IconButton(onPressed: null, icon: Icon(Icons.menu)),
          Text(''),
          IconButton(onPressed: null, icon: Icon(Icons.search))
        ],
      ),
    );
  }
}
