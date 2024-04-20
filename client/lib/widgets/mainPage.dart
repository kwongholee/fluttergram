import 'package:client/stores/feedListProvider.dart';
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
      if (scroll.position.userScrollDirection == ScrollDirection.reverse) {
        context.read<UserProvider>().changeDirection("down");
      } else {
        context.read<UserProvider>().changeDirection("up");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: context.watch<UserFeedListProvider>().feedList.length,
        controller: scroll,
        itemBuilder: (c,i) {return Feed(feedNum: i);},
      ),
    );
  }
}
