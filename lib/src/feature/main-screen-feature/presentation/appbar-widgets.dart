import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget mainAppbar = AppBar(
  toolbarHeight: 150,
  backgroundColor: Color(0xff0a2463),
  leading: Builder(builder: (context) {
    return IconButton(
      icon: Icon(
        Icons.account_circle,
        color: Colors.white,
        size: 30,
      ),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
    );
  }),
  centerTitle: true,
  title: Text(
    "ชั้นวางของ",
    style:
        TextStyle(color: Colors.white, fontSize: 30, fontFamily: "Sukhumvit"),
  ),
  actions: [
    IconButton(
        onPressed: null,
        icon: Icon(Icons.notifications, color: Colors.white, size: 30))
  ],
  bottom: PreferredSize(
    preferredSize: Size.fromHeight(0),
    child: Builder(
      builder: (context) {
        return GestureDetector(
          onTap: ()  {
            showSearch(context: context, delegate: MySearchbar());
          },
          child: Container(
              margin: EdgeInsets.only(bottom: 15),
              height: 56,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: null,
                            icon: Icon(Icons.menu),
                          ),
                          Text("ค้นหา"),
                        ],
                      ),
                    ],
                  ),
                  Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () {
                          showSearch(context: context, delegate: MySearchbar());
                        },
                        icon: Icon(Icons.search),
                      );
                    }
                  ),
                ],
              )),
        );
      }
    ),
  ),
);


class MySearchbar extends SearchDelegate{
  List<String> data = [
    'สินค้า1','สินค้า2','สินค้า3','สินค้า4','สินค้า5','สินค้า6','สินค้า7'
  ];
  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      icon: const Icon(Icons.clear,color:  Color(0xff0a2463),),
      onPressed: () {
        if(query.isEmpty){
          close(context, null);
        }else{
          query = '';
        }
      },
    ),
  ];
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back,color:  Color(0xff0a2463)),
    onPressed: () { close(context, null) ; },
  );
  @override
  Widget buildResults(BuildContext context) => Center(
    child: Text(
      query,
    ),
  );
  //flutter search bar with listview
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggesstions = data.where((element) {
      final result = element.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
        itemCount: suggesstions.length,
        itemBuilder: (context,index){
          final suggestion = suggesstions[index];
          return ListTile(
            title: Text(suggestion),
            onTap: (){
              query = suggestion;
              showResults(context);
            },
          );
        }
    );
  }
}