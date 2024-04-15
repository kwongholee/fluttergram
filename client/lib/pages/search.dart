import 'package:flutter/material.dart';
import 'package:client/stores/userProvider.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String keyword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Page"),),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SizedBox(width: 300, child: TextField(onChanged: (e) {setState(() {
            keyword = e;
          });})),
          IconButton(onPressed: () {}, icon: Icon(Icons.search))
        ])),
        SliverGrid(delegate: SliverChildBuilderDelegate((c,i) => Container(child: Image.asset('assets/jiwoo.jpg')), childCount: 15),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3))
      ]),
      bottomNavigationBar: context.watch<userProvider>().direction == "up" ? BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (i) {
          context.read<userProvider>().changeTab(i);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ) : null
    );
  }
}
