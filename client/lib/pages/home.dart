import 'package:flutter/material.dart';

import '../widgets/mainPage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var tab = 0;
  var direction = "up";

  setD(d) {
    setState(() {
      direction = d;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fluttergram"),
        actions: [IconButton(onPressed: () {
          setState(() {
            tab = 3;
          });
        }, icon: Icon(Icons.send))],
      ),
      body: Mainpage(setD: setD),
      bottomNavigationBar: direction == "up" ? BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (i) {
          setState(() {
            tab = i;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ) : null,
    );
  }
}
