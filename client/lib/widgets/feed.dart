import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  final writer = "이광호";
  final like = 0;
  final content = "지우 개예뻐 미친~~";

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FeedHeader(writer: writer),
          Image.asset('assets/jiwoo.jpg'),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Icon(Icons.favorite_border_outlined),
            Icon(Icons.send)
          ]),
          Text("좋아요: ${like.toString()}"),
          Text(content)
        ],
      )
    );
  }
}

class FeedHeader extends StatelessWidget {
  const FeedHeader({Key? key, this.writer}) : super(key: key);
  final writer;

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 10), child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [Icon(Icons.account_circle), Text("${writer}")]),
        Icon(Icons.more_vert)
      ],)
    );
  }
}
