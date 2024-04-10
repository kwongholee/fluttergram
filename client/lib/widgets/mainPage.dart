import 'package:client/stores/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'feed.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _HomeState();
}

class _HomeState extends State<Mainpage> {
  var scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    scroll.addListener(() {
      if(scroll.position.userScrollDirection == ScrollDirection.reverse) {
        context.watch<userProvider>().changeDirection("down");
      } else {
        context.watch<userProvider>().changeDirection("up");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(itemCount: 3, controller: scroll, itemBuilder: (i,c) {
        return Feed();
      },),
    );
  }
}
