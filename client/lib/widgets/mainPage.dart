import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'feed.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key, this.setD}) : super(key: key);
  final setD;
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
        widget.setD("down");
      } else {
        widget.setD("up");
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
