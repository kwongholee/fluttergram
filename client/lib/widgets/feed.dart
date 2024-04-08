import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  final writer = "이광호";
  final like = 0;
  final content = "지우 개예뻐 미친~~";

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FeedHeader(writer: writer),
          Image.asset('assets/jiwoo.jpg'),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Icon(Icons.favorite_border_outlined),
            Icon(Icons.send)
          ]),
          Text("좋아요: ${like.toString()}"),
          Text("작성자: ${writer}"),
          Text("${content}")
        ],
      ), padding: EdgeInsets.all(10),
    );
  }
}

class FeedHeader extends StatelessWidget {
  const FeedHeader({Key? key, this.writer}) : super(key: key);
  final writer;

  @override
  Widget build(BuildContext context) {
    return Container(child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [Icon(Icons.account_circle), Text("${writer}")]),
        Icon(Icons.more_vert)
      ],), padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
    );
  }
}
