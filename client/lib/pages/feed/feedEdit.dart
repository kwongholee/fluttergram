import 'package:client/stores/feedListProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedEdit extends StatefulWidget {
  const FeedEdit({Key? key, this.num}) : super(key: key);
  final num;

  @override
  State<FeedEdit> createState() => _FeedEditState();
}

class _FeedEditState extends State<FeedEdit> {
  var introduce = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {Navigator.pop(context);}),
        title: Text("Feed Edit Page"),
      ),
      body: SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Image.asset('assets/jiwoo.jpg'),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text("Introduce your Feed"),
          SizedBox(width: 150, child: TextField(onChanged: (e) {setState(() {
            setState(() {
              introduce = e;
            });
          });}))
        ]),
        TextButton(onPressed: () {
          context.read<FeedListProvider>().editFeed(introduce, widget.num);
          Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
        }, child: Text("edit"))
      ]),)
    );
  }
}
