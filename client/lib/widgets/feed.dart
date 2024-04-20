import 'package:client/pages/feed/feedEdit.dart';
import 'package:client/stores/feedListProvider.dart';
import 'package:client/stores/userProvider.dart';
import 'package:client/widgets/likeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key, this.feedNum}) : super(key: key);
  final feedNum;

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  bool isPressedLike = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FeedHeader(writer: context.watch<UserFeedListProvider>().feedList[widget.feedNum]["writer"], num: widget.feedNum),
          InkWell(onDoubleTap: () {setState(() {
            isPressedLike = !isPressedLike;
            if(isPressedLike) {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => LikeScreen(isPressedLike: isPressedLike)));
            }
          });}, child: Image.asset('assets/jiwoo.jpg'),),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            IconButton(onPressed: () {
              setState(() {
                isPressedLike = !isPressedLike;
              });
              if(isPressedLike) {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => LikeScreen(isPressedLike: isPressedLike)));
              }
            }, icon: isPressedLike ? Icon(Icons.favorite) : Icon(Icons.favorite_border_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.send))
          ]),
          Text("좋아요: ${context.watch<UserFeedListProvider>().feedList[widget.feedNum]["like"]}"),
          Text("${context.watch<UserFeedListProvider>().feedList[widget.feedNum]["introduce"]}")
        ],
      )
    );
  }
}

class FeedHeader extends StatelessWidget {
  const FeedHeader({Key? key, this.writer, this.num}) : super(key: key);
  final writer;
  final num;

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 10), child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [Icon(Icons.account_circle), Text(writer)]),
        writer == context.watch<UserProvider>().userInfo["id"] ? IconButton(icon: Icon(Icons.more_vert), onPressed: () {showDialog(context: context, barrierDismissible: true, builder: (context) {
          return FeedDialog(num: num);
        });}) : Text("")
      ],)
    );
  }
}

class FeedDialog extends StatefulWidget {
  FeedDialog({Key? key, this.num}) : super(key: key);
  final num;

  @override
  State<FeedDialog> createState() => _FeedDialogState();
}

class _FeedDialogState extends State<FeedDialog> {
  var dialogList = [
    {"name": "edit", "icon": Icon(Icons.edit), "widget": FeedEdit(num: num)},
    {"name": "delete", "icon": Icon(Icons.delete)}
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(child: SizedBox(
      height: 90,
      child: ListView.builder(itemCount: dialogList.length, itemBuilder: (c,i) {
        Map<String, dynamic> item = dialogList[i];
        return InkWell(
            onTap: () {
              Navigator.pop(context);
              if(i == 0) {
                Navigator.push(context, MaterialPageRoute(builder: (c) => FeedEdit(num: widget.num)));
              }
            },
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

