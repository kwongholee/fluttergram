import 'package:client/stores/feedListProvider.dart';
import 'package:client/stores/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddFeed extends StatefulWidget {
  const AddFeed({Key? key}) : super(key: key);

  @override
  State<AddFeed> createState() => _AddFeedState();
}

class _AddFeedState extends State<AddFeed> {
  var info = {"writer": "", "introduce": "", "like": 0};
  @override
  Widget build(BuildContext context) {
    var userId = context.watch<userProvider>().id;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {Navigator.pop(context);}),
        title: Text("Add Feed"),
      ),
      body: SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Image.asset('assets/jiwoo.jpg'),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text("Introduce your Feed"),
          SizedBox(width: 150, child: TextField(onChanged: (e) {setState(() {
            setState(() {
              info["introduce"] = e;
            });
          });}))
        ]),
        TextButton(onPressed: () {
          setState(() {
            info["writer"] = userId;
          });
          context.read<FeedListProvider>().addFeed(info);
          Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
        }, child: Text("add"))
      ]))
    );
  }
}