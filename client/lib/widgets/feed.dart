import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final writer = "이광호";
  var like = 0;
  bool isPressedLike = false;
  final content = "지우 개예뻐 미친~~";

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FeedHeader(writer: writer),
          InkWell(onDoubleTap: () {setState(() {
            isPressedLike = !isPressedLike;
            if(isPressedLike) {
              like++;
            } else {
              like--;
            }
          });}, child: Image.asset('assets/jiwoo.jpg'),),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            IconButton(onPressed: () {
              setState(() {
                isPressedLike = !isPressedLike;
                if(isPressedLike) {
                  like++;
                } else {
                  like--;
                }
              });
            }, icon: isPressedLike ? Icon(Icons.favorite) : Icon(Icons.favorite_border_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.send))
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
        Row(children: [Icon(Icons.account_circle), Text(writer)]),
        IconButton(icon: Icon(Icons.more_vert), onPressed: () {showDialog(context: context, barrierDismissible: true, builder: (context) {
          return FeedDialog();
        });})
      ],)
    );
  }
}

class FeedDialog extends StatefulWidget {
  FeedDialog({Key? key}) : super(key: key);

  @override
  State<FeedDialog> createState() => _FeedDialogState();
}

class _FeedDialogState extends State<FeedDialog> {
  var dialogList = [
    {"name": "edit", "icon": Icon(Icons.edit), "route": "/feed/edit"},
    {"name": "delete", "icon": Icon(Icons.delete), "route": "/feed/delete"}
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(child: SizedBox(
      height: 90,
      child: ListView.builder(itemCount: dialogList.length, itemBuilder: (c,i) {
        Map<String, dynamic> item = dialogList[i];
        return InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text(item["name"]),
                item["icon"]
              ],),
            )
        );}),
    ));
  }
}

